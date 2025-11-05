//
//  Serial.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-04.
//

import CoreAVR

@available(*, deprecated, message: "Use SerialParity.even instead.")
public let SERIAL_PARITY_EVEN:  UInt16 = 0x1
@available(*, deprecated, message: "Use SerialParity.odd instead.")
public let SERIAL_PARITY_ODD:   UInt16 = 0x2
@available(*, deprecated, message: "Use SerialParity.none instead.")
public let SERIAL_PARITY_NONE:  UInt16 = 0x3
@available(*, deprecated, message: "Use SerialParity.mark instead.")
public let SERIAL_PARITY_MARK:  UInt16 = 0x4
@available(*, deprecated, message: "Use SerialParity.space instead.")
public let SERIAL_PARITY_SPACE: UInt16 = 0x5
@available(*, deprecated, message: "Use SerialParity.mask instead.")
public let SERIAL_PARITY_MASK:  UInt16 = 0xF

public enum SerialParity: UInt16 {
    case even  = 0x1
    case odd   = 0x2
    case none  = 0x3
    case mark  = 0x4
    case space = 0x5
    case mask  = 0xF
}

@available(*, deprecated, message: "Use SerialStopBit.bit1 instead.")
public let SERIAL_STOP_BIT_1:    UInt16 = 0x10
@available(*, deprecated, message: "Use SerialStopBit.bit15 instead.")
public let SERIAL_STOP_BIT_1_5:  UInt16 = 0x20
@available(*, deprecated, message: "Use SerialStopBit.bit2 instead.")
public let SERIAL_STOP_BIT_2:    UInt16 = 0x30
@available(*, deprecated, message: "Use SerialStopBit.mask instead.")
public let SERIAL_STOP_BIT_MASK: UInt16 = 0xF0

public enum SerialStopBit: UInt16 {
    case bit1  = 0x10
    case bit15 = 0x20
    case bit2  = 0x30
    case mask  = 0xF0
}

@available(*, deprecated, message: "Use SerialData.data5 instead.")
public let SERIAL_DATA_5:    UInt16 = 0x100
@available(*, deprecated, message: "Use SerialData.data6 instead.")
public let SERIAL_DATA_6:    UInt16 = 0x200
@available(*, deprecated, message: "Use SerialData.data7 instead.")
public let SERIAL_DATA_7:    UInt16 = 0x300
@available(*, deprecated, message: "Use SerialData.data8 instead.")
public let SERIAL_DATA_8:    UInt16 = 0x400
@available(*, deprecated, message: "Use SerialData.mask instead.")
public let SERIAL_DATA_MASK: UInt16 = 0xF00

public enum SerialData: UInt16 {
    case data5 = 0x100
    case data6 = 0x200
    case data7 = 0x300
    case data8 = 0x400
    case mask  = 0xF00
}

@available(*, deprecated, message: "Use SerialConfig.config5N1 instead.")
public let SERIAL_5N1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.none.rawValue  | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6N1 instead.")
public let SERIAL_6N1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.none.rawValue  | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7N1 instead.")
public let SERIAL_7N1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.none.rawValue  | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8N1 instead.")
public let SERIAL_8N1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.none.rawValue  | SerialData.data8.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config5N2 instead.")
public let SERIAL_5N2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.none.rawValue  | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6N2 instead.")
public let SERIAL_6N2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.none.rawValue  | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7N2 instead.")
public let SERIAL_7N2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.none.rawValue  | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8N2 instead.")
public let SERIAL_8N2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.none.rawValue  | SerialData.data8.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config5E1 instead.")
public let SERIAL_5E1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.even.rawValue  | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6E1 instead.")
public let SERIAL_6E1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.even.rawValue  | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7E1 instead.")
public let SERIAL_7E1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.even.rawValue  | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8E1 instead.")
public let SERIAL_8E1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.even.rawValue  | SerialData.data8.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config5E2 instead.")
public let SERIAL_5E2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.even.rawValue  | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6E2 instead.")
public let SERIAL_6E2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.even.rawValue  | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7E2 instead.")
public let SERIAL_7E2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.even.rawValue  | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8E2 instead.")
public let SERIAL_8E2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.even.rawValue  | SerialData.data8.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config5O1 instead.")
public let SERIAL_5O1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.odd.rawValue   | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6O1 instead.")
public let SERIAL_6O1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.odd.rawValue   | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7O1 instead.")
public let SERIAL_7O1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.odd.rawValue   | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8O1 instead.")
public let SERIAL_8O1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.odd.rawValue   | SerialData.data8.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config5O2 instead.")
public let SERIAL_5O2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.odd.rawValue   | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6O2 instead.")
public let SERIAL_6O2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.odd.rawValue   | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7O2 instead.")
public let SERIAL_7O2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.odd.rawValue   | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8O2 instead.")
public let SERIAL_8O2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.odd.rawValue   | SerialData.data8.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config5M1 instead.")
public let SERIAL_5M1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.mark.rawValue  | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6M1 instead.")
public let SERIAL_6M1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.mark.rawValue  | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7M1 instead.")
public let SERIAL_7M1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.mark.rawValue  | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8M1 instead.")
public let SERIAL_8M1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.mark.rawValue  | SerialData.data8.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config5N2 instead.")
public let SERIAL_5M2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.mark.rawValue  | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6M2 instead.")
public let SERIAL_6M2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.mark.rawValue  | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7M2 instead.")
public let SERIAL_7M2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.mark.rawValue  | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8M2 instead.")
public let SERIAL_8M2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.mark.rawValue  | SerialData.data8.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config5S1 instead.")
public let SERIAL_5S1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.space.rawValue | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6S1 instead.")
public let SERIAL_6S1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.space.rawValue | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7S1 instead.")
public let SERIAL_7S1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.space.rawValue | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8S1 instead.")
public let SERIAL_8S1: UInt16 = (SerialStopBit.bit1.rawValue | SerialParity.space.rawValue | SerialData.data8.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config5S2 instead.")
public let SERIAL_5S2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.space.rawValue | SerialData.data5.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config6S2 instead.")
public let SERIAL_6S2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.space.rawValue | SerialData.data6.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config7S2 instead.")
public let SERIAL_7S2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.space.rawValue | SerialData.data7.rawValue)
@available(*, deprecated, message: "Use SerialConfig.config8S2 instead.")
public let SERIAL_8S2: UInt16 = (SerialStopBit.bit2.rawValue | SerialParity.space.rawValue | SerialData.data8.rawValue)

// Swift requires integer literal cases for enums, so no fancy reference.
public enum SerialConfig: UInt16 {
    case config5N1 = 0x113
    case config6N1 = 0x213
    case config7N1 = 0x313
    case config8N1 = 0x413
    case config5N2 = 0x133
    case config6N2 = 0x233
    case config7N2 = 0x333
    case config8N2 = 0x433
    case config5E1 = 0x111
    case config6E1 = 0x211
    case config7E1 = 0x311
    case config8E1 = 0x411
    case config5E2 = 0x131
    case config6E2 = 0x231
    case config7E2 = 0x331
    case config8E2 = 0x431
    case config5O1 = 0x112
    case config6O1 = 0x212
    case config7O1 = 0x312
    case config8O1 = 0x412
    case config5O2 = 0x132
    case config6O2 = 0x232
    case config7O2 = 0x332
    case config8O2 = 0x432
    case config5M1 = 0x114
    case config6M1 = 0x214
    case config7M1 = 0x314
    case config8M1 = 0x414
    case config5M2 = 0x134
    case config6M2 = 0x234
    case config7M2 = 0x334
    case config8M2 = 0x434
    case config5S1 = 0x115
    case config6S1 = 0x215
    case config7S1 = 0x315
    case config8S1 = 0x415
    case config5S2 = 0x135
    case config6S2 = 0x235
    case config7S2 = 0x335
    case config8S2 = 0x435
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
