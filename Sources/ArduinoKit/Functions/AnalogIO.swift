//
//  AnalogIO.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-25.
//

import CoreAVR

/// Arduino Reference: Language/Functions/Analog IO/analogWrite
///
/// Writes an analog value (PWM wave) to a pin. Can be used to light a LED at varying brightnesses or drive a motor at various speeds. After a call to analogWrite(), the pin will generate a steady rectangular wave of the specified duty cycle until the next call to `analogWrite()` (or a call to `digitalRead()` or `digitalWrite()`) on the same pin.
///
/// You do not need to call `pinMode()` to set the pin as an output before calling `analogWrite()`.
/// The `analogWrite` function has nothing to do with the analog pins or the `analogRead` function.
///
/// - Parameters:
/// - pin: The pin to write to
/// - value: the duty cycle between 0 and 255
@available(*, deprecated, message: "Use `analogWrite(pin: DigitalPin, value: UInt8)` instead.")
public func analogWrite(pin: UInt8, value: UInt8) {
    guard pin < 20 else { return }
    
    analogWrite(pin: .init(rawValue: pin)!, value: UInt8)
}

/// Arduino Reference: Language/Functions/Analog IO/analogWrite
///
/// Writes an analog value (PWM wave) to a pin. Can be used to light a LED at varying brightnesses or drive a motor at various speeds. After a call to analogWrite(), the pin will generate a steady rectangular wave of the specified duty cycle until the next call to `analogWrite()` (or a call to `digitalRead()` or `digitalWrite()`) on the same pin.
///
/// You do not need to call `pinMode()` to set the pin as an output before calling `analogWrite()`.
/// The `analogWrite` function has nothing to do with the analog pins or the `analogRead` function.
///
/// - Parameters:
/// - pin: The pin to write to
/// - value: the duty cycle between 0 and 255
// TODO: Should we rename `DigitalPin` to `Pin`?
public func analogWrite(pin: DigitalPin, value: UInt8) {
    pinMode(pin: pin, mode: .output)
    
    if value == .min {
        digitalWrite(pin: pin, value: .low)
        return
    }
    
    if value == .max {
        digitalWrite(pin: pin, value: .high)
        return
    }
    
    switch digitalPinToTimer(pin: pin) {
        case .timer0A:
            timer0.compareOutputModeA = .clear
            timer0.outputCompareRegisterA = value
        case .timer0B:
            timer0.compareOutputModeB = .clear
            timer0.outputCompareRegisterB = value
        case .timer1A:
            timer1.compareOutputModeA = .clear
            timer1.outputCompareRegisterA = UInt16(value)
        case .timer1B:
            timer1.compareOutputModeB = .clear
            timer1.outputCompareRegisterB = UInt16(value)
        case .timer2A:
            timer2.compareOutputModeA = .clear
            timer2.outputCompareRegisterA = value
        case .timer2B:
            timer2.compareOutputModeB = .clear
            timer2.outputCompareRegisterB = value
        case .noTimer:
            digitalWrite(pin: pin, value: value < 128 ? .low : .high)
    }
}
