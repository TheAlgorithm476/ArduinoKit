//
//  AnalogIO.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-25.
//

import CoreAVR

public enum AnalogPin: UInt8 {
    case analog0 = 0
    case analog1 = 1
    case analog2 = 2
    case analog3 = 3
    case analog4 = 4
    case analog5 = 5
}

@usableFromInline
internal let analogReference: VoltageReference = .externalCapacitor

/// Arduino Reference: Language/Functions/Analog IO/analogRead
///
/// Reads the value from the specified analog pin.
/// Arduino boards contain a multichannel, 10-bit analog to digital converter.
/// This means that it will map input voltages between 0 and the operating voltage(5V or 3.3V) into integer values between 0 and 1023.
/// On an Arduino UNO, for example, this yields a resolution between readings of: 5 volts / 1024 units or, 0.0049 volts (4.9 mV) per unit.
///
/// The input range can be changed using `analogReference()`, while the resolution can be changed (only for Zero, Due and MKR boards) using `analogReadResolution()`.
///
/// On ATmega based boards (UNO, Nano, Mini, Mega), it takes about 100 microseconds (0.0001 s) to read an analog input, so the maximum reading rate is about 10,000 times a second.
///
/// - Parameters:
/// - pin: The pin to read an analog input from.
/// - Returns: The analog reading on the pin.
@inlinable
@inline(__always)
@available(*, deprecated, message: "Use `analogRead(pin: AnalogPin)` instead.")
public func analogRead(pin: UInt8) -> UInt16 { // TODO: Rewrite after ADC is properly and fully implemented
    guard pin < 20 else { return UInt16.max }
    
    let pin = pin <= 14 ? pin - 14 : pin
    return analogRead(pin: .init(rawValue: pin)!)
}

/// Arduino Reference: Language/Functions/Analog IO/analogRead
///
/// Reads the value from the specified analog pin.
/// Arduino boards contain a multichannel, 10-bit analog to digital converter.
/// This means that it will map input voltages between 0 and the operating voltage(5V or 3.3V) into integer values between 0 and 1023.
/// On an Arduino UNO, for example, this yields a resolution between readings of: 5 volts / 1024 units or, 0.0049 volts (4.9 mV) per unit.
///
/// The input range can be changed using `analogReference()`, while the resolution can be changed (only for Zero, Due and MKR boards) using `analogReadResolution()`.
///
/// On ATmega based boards (UNO, Nano, Mini, Mega), it takes about 100 microseconds (0.0001 s) to read an analog input, so the maximum reading rate is about 10,000 times a second.
///
/// - Parameters:
/// - pin: The pin to read an analog input from.
/// - Returns: The analog reading on the pin.
@inlinable
@inline(__always)
public func analogRead(pin: AnalogPin) -> UInt16 {
    adc.reference = analogReference
    adc.channel = .init(rawValue: pin.rawValue) ?? .gnd
    adc.converting = true
    
    while adc.converting {
        // do nothing
    }
    
    return adc.dataRegister
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
@inlinable
@inline(__always)
@available(*, deprecated, message: "Use `analogWrite(pin: DigitalPin, value: UInt8)` instead.")
public func analogWrite(pin: UInt8, value: UInt8) {
    guard pin < 20 else { return }
    
    analogWrite(pin: .init(rawValue: pin)!, value: value)
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
@inlinable
@inline(__always)
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
