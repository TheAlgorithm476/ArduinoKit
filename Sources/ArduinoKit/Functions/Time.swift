//
//  Time.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-14.
//

import CoreAVR

// MARK: Utilities
@inlinable
@inline(always)
internal func clockCyclesPerMicrosecond() -> UInt32 {
    return UInt32(cpuFrequency) / 1000000
}

@inlinable
@inline(always)
internal func clockCyclesToMicroseconds(_ cycles: UInt32) -> UInt32 {
    return cycles / clockCyclesPerMicrosecond()
}

// MARK: Timings
private let MICROSECONDS_PER_TIMER0_OVERFLOW = clockCyclesToMicroseconds(64 * 256)
private let MILLIS_INC = MICROSECONDS_PER_TIMER0_OVERFLOW / 1000

private let FRACT_INC = (MICROSECONDS_PER_TIMER0_OVERFLOW % 1000) >> 3
private let FRACT_MAX = 1000 >> 3

internal let timer0OverflowCount = Volatile<UInt32>(initialValue: 0, objectSize: 4)
internal let timer0Millis = Volatile<UInt32>(initialValue: 0, objectSize: 4)
internal var timer0Fract = Volatile<UInt8>(initialValue: 0, objectSize: 1)

/// Arduino Reference: Language/Functions/Time/micros
///
/// Returns the number of microseconds since the Arduino board began running the current program.
/// This number will overflow (go back to zero), after approximately 70 minutes.
/// On the board from the Arduino Portena family this function has a resolution of one microsecond on all cores.
/// On 16 MHz Arduino boards (e.g. Duemilanove and Nano), this function has a resolution of four microseconds (i.e. the value returned is always a multiple of four).
/// On 8 MHz Arduino boards (e.g. the LilyPad), this function has a resolution of eight microseconds.
///
/// - Returns: The number of microseconds since the Arduino board began running the current program.
public func micros() -> UInt32 {
    let statusRegister = cpuCore.statusRegister
    
    Interrupts.disableInterrupts()
    
    var overflowCount = timer0OverflowCount.get()
    let timer = timer0.count
    
    if timer0.overflowFlag {
        overflowCount += 1
    }
    
    cpuCore.statusRegister = statusRegister
    return ((overflowCount << 8) + UInt32(timer)) * (64 / clockCyclesPerMicrosecond())
}

/// Arduino Reference: Language/Functions/Time/millis
///
/// Returns the number of milliseconds passed since the Arduino board began running the current program.
/// This number will overflow (go back to zero), after approximately 50 days.
///
/// - Returns: The number of milliseconds since the Arduino board began running the current program
public func millis() -> UInt32 {
    let statusRegister = cpuCore.statusRegister
    
    Interrupts.disableInterrupts()
    
    let millis = timer0Millis.get()
    cpuCore.statusRegister = statusRegister
    
    return millis
}

/// Arduino Reference: Language/Functions/Time/delay
///
/// Pauses the program for the amount of time (in milliseconds) specified as parameter. (There are 1000 milliseconds in a second.)
///
/// - Parameters:
/// - millis: The number of milliseconds to pause.
public func delay(millis: UInt32) {
    var ms = millis
    var start = micros()
    
    while ms > 0 {
        // yield()
        while ms > 0 && (micros() - start) >= 1000 {
            ms -= 1
            start += 1000
        }
    }
}

internal func timer0OverflowInterruptHandler() {
    // Ensure the values are read by explicitly copying them
    var millis = timer0Millis.get()
    var fract = timer0Fract.get()
    var count = timer0OverflowCount.get()
    
    millis += MILLIS_INC
    fract += UInt8(FRACT_INC)
    
    if fract >= FRACT_MAX {
        fract -= UInt8(FRACT_MAX)
        millis += 1
    }
    
    count += 1
    
    timer0Fract.set(newValue: fract)
    timer0Millis.set(newValue: millis)
    timer0OverflowCount.set(newValue: count)
}
