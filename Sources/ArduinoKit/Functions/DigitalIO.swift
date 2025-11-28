//
//  DigitalIO.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-17.
//

import CoreAVR

public enum DigitalPin: UInt8 {
    case pin0 = 0
    case pin1 = 1
    case pin2 = 2
    case pin3 = 3
    case pin4 = 4
    case pin5 = 5
    case pin6 = 6
    case pin7 = 7
    case pin8 = 8
    case pin9 = 9
    case pin10 = 10
    case pin11 = 11
    case pin12 = 12
    case pin13 = 13
    case pin14 = 14
    case pin15 = 15
    case pin16 = 16
    case pin17 = 17
    case pin18 = 18
    case pin19 = 19
}

public enum PinTimer {
    case noTimer
    case timer0A
    case timer0B
    case timer1A
    case timer1B
    case timer2A
    case timer2B
}

@inlinable
@inline(__always)
internal func digitalPinToTimer(pin: DigitalPin) -> PinTimer {
    switch pin {
        case .pin6:
            return .timer0A
        case .pin5:
            return .timer0B
        case .pin9:
            return .timer1A
        case .pin10:
            return .timer1B
        case .pin11:
            return .timer2A
        case .pin3:
            return .timer2B
        default:
            return .noTimer
    }
}

/// Arduino Reference: Language/Functions/Digital IO/pinMode
///
/// Configures the specified pin to behave either as an input or an output.
///
/// It is possible to enable the internal pullup resistors with the mode `INPUT_PULLUP`. Additionally, the `INPUT` mode explicitly disables the internal pullups.
///
/// KNOWN LIMITATIONS: passing `INPUT_PULLUP` does nothing, as CoreAVR (currently) does not have a way to represent it.
///
/// - Parameters:
/// - pin: The pin number to set the mode of.
/// - mode: `INPUT`, `OUTPUT`, or `INPUT_PULLUP`.
@inlinable
@inline(__always)
@available(*, deprecated, message: "Use `pinMode(pin: DigitalPin, mode: DataDirectionFlag)` instead.")
public func pinMode(pin: UInt8, mode: UInt8) {
    guard pin < 20 else { return }
    guard mode < 0x02 else { return }
    
    let mode: DataDirectionFlag? = switch mode {
        case INPUT: .input
        case OUTPUT: .output
        default: nil // This should never happen!
    }
    
    pinMode(pin: .init(rawValue: pin)!, mode: mode!)
}

/// Arduino Reference: Language/Functions/Digital IO/pinMode
///
/// Configures the specified pin to behave either as an input or an output.
///
/// - Parameters:
/// - analogPin: The pin number to set the mode of.
/// - mode: The data direction flag (e.g. `.input`, `.output`)
@inlinable
@inline(__always)
public func pinMode(analogPin: AnalogPin, mode: DataDirectionFlag) {
    switch analogPin {
        case .analog0: GPIO.pc0.setDataDirection(mode)
        case .analog1: GPIO.pc1.setDataDirection(mode)
        case .analog2: GPIO.pc2.setDataDirection(mode)
        case .analog3: GPIO.pc3.setDataDirection(mode)
        case .analog4: GPIO.pc4.setDataDirection(mode)
        case .analog5: GPIO.pc5.setDataDirection(mode)
    }
}

/// Arduino Reference: Language/Functions/Digital IO/pinMode
///
/// Configures the specified pin to behave either as an input or an output.
///
/// - Parameters:
/// - pin: The pin number to set the mode of.
/// - mode: The data direction flag (e.g. `.input`, `.output`)
@inlinable
@inline(__always)
public func pinMode(pin: DigitalPin, mode: DataDirectionFlag) {
    switch pin {
        case .pin0:  GPIO.pd0.setDataDirection(mode)
        case .pin1:  GPIO.pd1.setDataDirection(mode)
        case .pin2:  GPIO.pd2.setDataDirection(mode)
        case .pin3:  GPIO.pd3.setDataDirection(mode)
        case .pin4:  GPIO.pd4.setDataDirection(mode)
        case .pin5:  GPIO.pd5.setDataDirection(mode)
        case .pin6:  GPIO.pd6.setDataDirection(mode)
        case .pin7:  GPIO.pd7.setDataDirection(mode)
        case .pin8:  GPIO.pb0.setDataDirection(mode)
        case .pin9:  GPIO.pb1.setDataDirection(mode)
        case .pin10: GPIO.pb2.setDataDirection(mode)
        case .pin11: GPIO.pb3.setDataDirection(mode)
        case .pin12: GPIO.pb4.setDataDirection(mode)
        case .pin13: GPIO.pb5.setDataDirection(mode)
        case .pin14: GPIO.pc0.setDataDirection(mode)
        case .pin15: GPIO.pc1.setDataDirection(mode)
        case .pin16: GPIO.pc2.setDataDirection(mode)
        case .pin17: GPIO.pc3.setDataDirection(mode)
        case .pin18: GPIO.pc4.setDataDirection(mode)
        case .pin19: GPIO.pc5.setDataDirection(mode)
    }
}

@inlinable
@inline(__always)
internal func disablePWM(for timer: PinTimer) {    
    switch timer {
        case .timer0A:
            timer0.compareOutputModeA = .normal
        case .timer0B:
            timer0.compareOutputModeB = .normal
        case .timer1A:
            timer1.compareOutputModeA = .normal
        case .timer1B:
            timer1.compareOutputModeB = .normal
        case .timer2A:
            timer2.compareOutputModeA = .normal
        case .timer2B:
            timer2.compareOutputModeB = .normal
        default: // Pin isn't connected to a timer
            return
    }
}

/// Arduino Reference: Language/Functions/Digital IO/digitalWrite
///
/// Write a `HIGH` or `LOW` value to a digital pin.
///
/// If the pin has been configured as an `OUTPUT` with `pinMode()`, its voltage will be set to the corresponding value: 5V (or 3.3V on 3.3V boards) for `HIGH`, 0V (ground) for `LOW`.
///
/// If the pin is configured as an `INPUT`, `digitalWrite()` will enable (`HIGH`) or disable (`LOW`) the internal pullup on the input pin. It is recommended to set the `pinMode()` to `INPUT_PULLUP` to enable the internal pull-up resistor.
///
/// If you do not set the `pinMode()` to `OUTPUT`, and connect an LED to a pin, when calling `digitalWrite(HIGH)`, the LED may appear dim. Without explicitly setting `pinMode()`, `digitalWrite()` will have enabled the internal pull-up resistor, which acts like a large current-limiting resistor.
///
/// - Parameters:
/// - pin: The pin number
/// - value: `HIGH` or `LOW`
@inlinable
@inline(__always)
@available(*, deprecated, message: "Use `digitalWrite(pin: DigitalPin, value: DigitalValue)` instead.")
public func digitalWrite(pin: UInt8, value: UInt8) {
    guard pin < 20 else { return }
    guard value < 0x02 else { return }
    
    digitalWrite(pin: .init(rawValue: pin)!, value: value == 0x01 ? .high : .low)
}

/// Writes a CoreAVR `DigitalValue` to an ArduinoKit `DigitalPin`.
///
/// - Parameters:
/// - pin: The digital pin
/// - value: `.high` or `.low`
@inlinable
@inline(__always)
public func digitalWrite(pin: DigitalPin, value: DigitalValue) {
    let timer = digitalPinToTimer(pin: pin)
    
    // Disable PWM before writing to pin
    disablePWM(for: timer)
    
    switch pin {
        case .pin0:  GPIO.pd0.setValue(value)
        case .pin1:  GPIO.pd1.setValue(value)
        case .pin2:  GPIO.pd2.setValue(value)
        case .pin3:  GPIO.pd3.setValue(value)
        case .pin4:  GPIO.pd4.setValue(value)
        case .pin5:  GPIO.pd5.setValue(value)
        case .pin6:  GPIO.pd6.setValue(value)
        case .pin7:  GPIO.pd7.setValue(value)
        case .pin8:  GPIO.pb0.setValue(value)
        case .pin9:  GPIO.pb1.setValue(value)
        case .pin10: GPIO.pb2.setValue(value)
        case .pin11: GPIO.pb3.setValue(value)
        case .pin12: GPIO.pb4.setValue(value)
        case .pin13: GPIO.pb5.setValue(value)
        case .pin14: GPIO.pc0.setValue(value)
        case .pin15: GPIO.pc1.setValue(value)
        case .pin16: GPIO.pc2.setValue(value)
        case .pin17: GPIO.pc3.setValue(value)
        case .pin18: GPIO.pc4.setValue(value)
        case .pin19: GPIO.pc5.setValue(value)
    }
}

/// Arduino Reference: Language/Functions/Digital IO/digitalRead
///
/// Reads the value from a specified digital pin, either `HIGH` or `LOW`.
///
/// - Parameters:
/// - pin: The pin number you want to read
/// - Returns: `HIGH` or `LOW`.
@inlinable
@inline(__always)
@available(*, deprecated, message: "Use `digitalRead(pin: DigitalPin) -> DigitalValue` instead.")
public func digitalRead(pin: UInt8) -> UInt8 {
    guard pin < 20 else { return LOW }
    
    return digitalRead(pin: .init(rawValue: pin)!) == .high ? HIGH : LOW
}

/// Reads a CoreAVR `DigitalValue` from an ArduinoKit `DigitalPin`.
///
/// - Parameters:
/// - pin: The digital pin
/// - Returns: `.high` or `.low`
@inlinable
@inline(__always)
public func digitalRead(pin: DigitalPin) -> DigitalValue {
    let timer = digitalPinToTimer(pin: pin)
    
    // Disable PWM before reading from pin
    disablePWM(for: timer)
    
    return switch pin {
        case .pin0:  GPIO.pd0.value()
        case .pin1:  GPIO.pd1.value()
        case .pin2:  GPIO.pd2.value()
        case .pin3:  GPIO.pd3.value()
        case .pin4:  GPIO.pd4.value()
        case .pin5:  GPIO.pd5.value()
        case .pin6:  GPIO.pd6.value()
        case .pin7:  GPIO.pd7.value()
        case .pin8:  GPIO.pb0.value()
        case .pin9:  GPIO.pb1.value()
        case .pin10: GPIO.pb2.value()
        case .pin11: GPIO.pb3.value()
        case .pin12: GPIO.pb4.value()
        case .pin13: GPIO.pb5.value()
        case .pin14: GPIO.pc0.value()
        case .pin15: GPIO.pc1.value()
        case .pin16: GPIO.pc2.value()
        case .pin17: GPIO.pc3.value()
        case .pin18: GPIO.pc4.value()
        case .pin19: GPIO.pc5.value()
    }
}
