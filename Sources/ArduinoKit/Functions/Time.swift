//
//  Time.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-14.
//

import CoreAVR

// Timer0 ticks every 64 clock cycles with the current prescaler setting, and the overflow handler is called every 256 ticks.
internal let MICROSECONDS_PER_TIMER0_OVERFLOW = clockCyclesToMicroseconds(64 * 256)

// The (whole) number of milliseconds per Timer0 overflow
internal let MILLIS_INC = MICROSECONDS_PER_TIMER0_OVERFLOW / 1000

// The (fractional) number of milliseconds per Timer0 overflow.
// Shifted right by 3 to fit into a UInt8.
internal let FRACT_INC = UInt8((MICROSECONDS_PER_TIMER0_OVERFLOW % 1000) >> 3)
internal let FRACT_MAX = UInt8(125) // (1000 >> 3)

@usableFromInline
internal var timer0OverflowCount = ConstantSizeBuffer<UInt32>.init(count: 1, repeating: 0)
@usableFromInline
internal var timer0Millis = ConstantSizeBuffer<UInt32>.init(count: 1, repeating: 0)
internal var timer0Fract = ConstantSizeBuffer<UInt8>.init(count: 1, repeating: 0)

@usableFromInline
internal let CLOCK_CYCLES_PER_MICROSECOND = UInt32(cpuFrequency / 1000000)

@inlinable
@inline(__always)
internal func clockCyclesToMicroseconds(_ cycles: UInt32) -> UInt32 {
    return cycles / CLOCK_CYCLES_PER_MICROSECOND
}

@inlinable
@inline(__always)
internal func microsecondsToClockCycles(_ micros: UInt32) -> UInt32 {
    return micros * CLOCK_CYCLES_PER_MICROSECOND
}

/// Arduino Reference: Language/Functions/Time/micros
///
/// Returns the number of microseconds since the Arduino board began running the current program.
/// This number will overflow (go back to zero), after approximately 70 minutes.
/// On the board from the Arduino Portena family this function has a resolution of one microsecond on all cores.
/// On 16 MHz Arduino boards (e.g. Duemilanove and Nano), this function has a resolution of four microseconds (i.e. the value returned is always a multiple of four).
/// On 8 MHz Arduino boards (e.g. the LilyPad), this function has a resolution of eight microseconds.
///
/// - Returns: The number of microseconds since the Arduino board began running the current program.
@inlinable
@inline(__always)
public func micros() -> UInt32 {
    let statusRegister = cpuCore.statusRegister
    
    Interrupts.disableInterrupts()
    
    var overflowCount = timer0OverflowCount[0]
    let timer = timer0.timerCounterNumber
    
    if (timer0.timerInterruptFlagRegister & 0b00000001) == 1 { // TODO: Replace with bit access once HALGEN parity gets merged
        overflowCount += 1
    }
    
    cpuCore.statusRegister = statusRegister
    return ((overflowCount << 8) + UInt32(timer)) * (64 / CLOCK_CYCLES_PER_MICROSECOND)
}

/// Arduino Reference: Language/Functions/Time/millis
///
/// Returns the number of milliseconds passed since the Arduino board began running the current program.
/// This number will overflow (go back to zero), after approximately 50 days.
///
/// - Returns: The number of milliseconds since the Arduino board began running the current program
@inlinable
@inline(__always)
public func millis() -> UInt32 {
    let statusRegister = cpuCore.statusRegister
    
    Interrupts.disableInterrupts()
    
    let millis = timer0Millis[0]
    cpuCore.statusRegister = statusRegister
    
    return millis
}

/// Arduino Reference: Language/Functions/Time/delay
///
/// Pauses the program for the amount of time (in milliseconds) specified as parameter. (There are 1000 milliseconds in a second.)
///
/// - Parameters:
/// - millis: The number of milliseconds to pause.
@inlinable
@inline(__always)
public func delay(millis: UInt32) {
    var millis = millis
    var start = micros()
    
    while millis > 0 {
        // yield()
        while millis > 0 && (micros() - start) >= 1000 {
            millis -= 1
            start += 1000
        }
    }
}

@inline(never)
@interruptHandler
@_silgen_name("__vector_16")
internal func timer0OverflowInterruptHandler() {
    var millis = timer0Millis[0]
    var fract = timer0Fract[0]
    
    millis += MILLIS_INC
    fract += FRACT_INC
    
    if fract >= FRACT_MAX {
        fract -= FRACT_MAX
        millis += 1
    }
    
    timer0Fract[0] = fract
    timer0Millis[0] = millis
    timer0OverflowCount[0] = timer0OverflowCount[0] + 1
}
