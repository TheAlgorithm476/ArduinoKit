//
//  Serial.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-04.
//

import CoreAVR

struct Serial: Stream {
    // TODO: Parity with ArduinoCore.
    /// Arduino Reference: Language/Functions/Communication/Serial/begin
    ///
    /// Sets the data rate in bits per second (baud) for serial data transmission.
    ///
    /// An optional second argument configures the data, parity, and stop bits. The default is 8 data bits, no parity, one stop bit.
    ///
    /// - Parameters:
    /// - baudRate: The data rate in bits per second
    @inlinable
    @inline(__always)
    static func begin(baudRate: UInt32 = 57600) {
        uart0.baudRate = 57600
        uart0.transmitterEnable = .on
        uart0.receiverEnable = .on
    }
}
