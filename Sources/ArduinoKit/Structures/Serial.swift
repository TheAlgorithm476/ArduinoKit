//
//  Serial.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-04.
//

import CoreAVR

@available(*, deprecated, message: "Use SerialConfig.config5N1 instead.")
public let SERIAL_5N1: UInt8 = 0x00
@available(*, deprecated, message: "Use SerialConfig.config6N1 instead.")
public let SERIAL_6N1: UInt8 = 0x02
@available(*, deprecated, message: "Use SerialConfig.config7N1 instead.")
public let SERIAL_7N1: UInt8 = 0x04
@available(*, deprecated, message: "Use SerialConfig.config8N1 instead.")
public let SERIAL_8N1: UInt8 = 0x06
@available(*, deprecated, message: "Use SerialConfig.config5N2 instead.")
public let SERIAL_5N2: UInt8 = 0x08
@available(*, deprecated, message: "Use SerialConfig.config6N2 instead.")
public let SERIAL_6N2: UInt8 = 0x0A
@available(*, deprecated, message: "Use SerialConfig.config7N2 instead.")
public let SERIAL_7N2: UInt8 = 0x0C
@available(*, deprecated, message: "Use SerialConfig.config8N2 instead.")
public let SERIAL_8N2: UInt8 = 0x0E
@available(*, deprecated, message: "Use SerialConfig.config5E1 instead.")
public let SERIAL_5E1: UInt8 = 0x20
@available(*, deprecated, message: "Use SerialConfig.config6E1 instead.")
public let SERIAL_6E1: UInt8 = 0x22
@available(*, deprecated, message: "Use SerialConfig.config7E1 instead.")
public let SERIAL_7E1: UInt8 = 0x24
@available(*, deprecated, message: "Use SerialConfig.config8E1 instead.")
public let SERIAL_8E1: UInt8 = 0x26
@available(*, deprecated, message: "Use SerialConfig.config5E2 instead.")
public let SERIAL_5E2: UInt8 = 0x28
@available(*, deprecated, message: "Use SerialConfig.config6E2 instead.")
public let SERIAL_6E2: UInt8 = 0x2A
@available(*, deprecated, message: "Use SerialConfig.config7E2 instead.")
public let SERIAL_7E2: UInt8 = 0x2C
@available(*, deprecated, message: "Use SerialConfig.config8E2 instead.")
public let SERIAL_8E2: UInt8 = 0x2E
@available(*, deprecated, message: "Use SerialConfig.config5O1 instead.")
public let SERIAL_5O1: UInt8 = 0x30
@available(*, deprecated, message: "Use SerialConfig.config6O1 instead.")
public let SERIAL_6O1: UInt8 = 0x32
@available(*, deprecated, message: "Use SerialConfig.config7O1 instead.")
public let SERIAL_7O1: UInt8 = 0x34
@available(*, deprecated, message: "Use SerialConfig.config8O1 instead.")
public let SERIAL_8O1: UInt8 = 0x36
@available(*, deprecated, message: "Use SerialConfig.config5O2 instead.")
public let SERIAL_5O2: UInt8 = 0x38
@available(*, deprecated, message: "Use SerialConfig.config6O2 instead.")
public let SERIAL_6O2: UInt8 = 0x3A
@available(*, deprecated, message: "Use SerialConfig.config7O2 instead.")
public let SERIAL_7O2: UInt8 = 0x3C
@available(*, deprecated, message: "Use SerialConfig.config8O2 instead.")
public let SERIAL_8O2: UInt8 = 0x3E

public enum SerialConfig: UInt8 {
    case config5N1 = 0x00
    case config6N1 = 0x02
    case config7N1 = 0x04
    case config8N1 = 0x06
    case config5N2 = 0x08
    case config6N2 = 0x0A
    case config7N2 = 0x0C
    case config8N2 = 0x0E
    case config5E1 = 0x20
    case config6E1 = 0x22
    case config7E1 = 0x24
    case config8E1 = 0x26
    case config5E2 = 0x28
    case config6E2 = 0x2A
    case config7E2 = 0x2C
    case config8E2 = 0x2E
    case config5O1 = 0x30
    case config6O1 = 0x32
    case config7O1 = 0x34
    case config8O1 = 0x36
    case config5O2 = 0x38
    case config6O2 = 0x3A
    case config7O2 = 0x3C
    case config8O2 = 0x3E
}

/// Arduino Reference: Language/Functions/Communication/Serial
///
/// Used for communcation between the Arduino board and a computer or other devices. All Arduino board have at least one serial port (also known as a UART or USART), and some have several.
///
/// |           Board            |  Serial Pins   |    Serial1 pins    |    Serial2 pins    |    Serial3 pins    |    Serial4 pins    |
/// |----------------------------|----------------|--------------------|--------------------|--------------------|--------------------|
/// | UNO R3, UNO R3 SMD Mini    | 0 (RX), 1 (TX) |                    |                    |                    |                    |
/// | Nano (classic)             | 0 (RX), 1 (TX) |                    |                    |                    |                    |
/// | UNO R4 Minima, UNO R4 WiFi |                | 0 (RX0), 1 (TX0)   |                    |                    |                    |
/// | Leonardo, Micro, Yún Rev2  |                | 0 (RX), 1 (TX)     |                    |                    |                    |
/// | Uno WiFi Rev.2             |                | 0 (RX), 1 (TX)     |                    |                    |                    |
/// | MKR boards                 |                | 13 (RX), 14 (TX)   |                    |                    |                    |
/// | Zero                       |                | 0 (RX), 1 (TX)     |                    |                    |                    |
/// | Giga R1 WiFi               |                | 0 (RX), 1 (TX)     | 19 (RX1), 18 (TX1) | 17 (RX2), 16 (TX2) | 15 (RX3), 14 (TX3) |
/// | Due                        | 0 (RX), 1 (TX) | 19 (RX1), 18 (TX1) | 17 (RX2), 16 (TX2) | 15 (RX3), 14 (TX3) |                    |
/// | Mega 2560 Rev3             | 0 (RX), 1 (TX) | 19 (RX1), 18 (TX1) | 17 (RX2), 16 (TX2) | 15 (RX3), 14 (TX3) |                    |
/// | Nano 33 IoT                |                | 0 (RX0), 1 (TX0)   |                    |                    |                    |
/// | Nano RP2040 Connect        |                | 0 (RX0), 1 (TX0)   |                    |                    |                    |
/// | Nano BLE / BLE Sense       |                | 0 (RX0), 1 (TX0)   |                    |                    |                    |
///
/// On older boards (Uno, Nano, Mini, and Mega), pins 0 and 1 are used for communication with the computer. Connecting anything to those pins can interfere with that communication, including causing failed uploads to the board.
///
/// Serial communication on pins TX/RX uses TTL logic levels (5V or 3.3V depending on the board). Don't connect these pins directly to an RS232 serial port; they operate at +/- 12V and can damage your Arduino board.
///
/// To use these extra serial ports to communicate with your personal computer, you will need an additional USB-to-serial adapter, as they are not connected to the Mega's USB-to-serial adapter. To use them to communicate with an external TTL serial device, connect the TX pin to your device's RX pin, the RX to your device's TX pin, and the ground of your Mega to your device's ground.
public struct Serial: Stream {
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
    public static func begin(baudRate: UInt32 = 57600) {
        uart0.baudRate = 57600
        uart0.transmitterEnable = .on
        uart0.receiverEnable = .on
    }
}
