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
