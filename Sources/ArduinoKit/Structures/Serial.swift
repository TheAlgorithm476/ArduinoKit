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
    @usableFromInline
    internal static let SERIAL_TX_BUFFER_SIZE: UInt8 = 64
    @usableFromInline
    internal static let SERIAL_RX_BUFFER_SIZE: UInt8 = 64
    
    @usableFromInline
    internal static var written: Bool = false // Has any byte been written to UART since `begin()`?
    @usableFromInline
    internal static var txBufferHead: UInt8 = 0
    @usableFromInline
    internal static var txBufferTail: UInt8 = 0
    @usableFromInline
    internal static var rxBufferHead: UInt8 = 0
    @usableFromInline
    internal static var rxBufferTail: UInt8 = 0
    
    @usableFromInline
    internal static var txBuffer = ConstantSizeBuffer<UInt8>(count: Int(SERIAL_TX_BUFFER_SIZE), repeating: 0)
    @usableFromInline
    internal static var rxBuffer = ConstantSizeBuffer<UInt8>(count: Int(SERIAL_RX_BUFFER_SIZE), repeating: 0)
    
    /// Arduino Reference: Language/Functions/Communication/Serial/begin
    ///
    /// Sets the data rate in bits per second (baud) for serial data transmission.
    ///
    /// An optional second argument configures the data, parity, and stop bits. The default is 8 data bits, no parity, one stop bit.
    ///
    /// - Parameters:
    /// - speed: The data rate in bits per second
    /// - config: Sets data, parity, and stop bits.
    @inlinable
    @inline(__always)
    @available(*, deprecated, message: "Use Serial.begin(speed: UInt32, config: SerialConfig) instead.")
    public static func begin(_ baud: UInt32, _ config: UInt8 = SERIAL_8N1) {
        Self.begin(speed: baud, config: .init(rawValue: config) ?? .config8N1)
    }
    
    /// Sets the data rate in bits per second (baud) for serial data transmission.
    ///
    /// An optional second argument configures the data, parity, and stop bits. The default is 8 data bits, no parity, one stop bit.
    ///
    /// - Parameters:
    /// - speed: The data rate in bits per second
    /// - config: Sets data, parity, and stop bits.
    @inlinable
    @inline(__always)
    public static func begin(speed: UInt32 = 57600, config: SerialConfig = .config8N1) {
        var baudSetting: UInt16 = UInt16((UInt32(cpuFrequency) / 4 / speed - 1) / 2)
        uart0.asynchronousDoubleSpeedMode = .on
        
        if UInt32(cpuFrequency) == 16000000 && speed == 57600 && baudSetting > 4095 {
            uart0.asynchronousDoubleSpeedMode = .off
            baudSetting = UInt16((UInt32(cpuFrequency) / 8 / speed - 1) / 2)
        }
        
        uart0.baudRateRegister = baudSetting
        
        Self.written = false
        
        uart0.USARTControlAndStatusRegisterC = config.rawValue
        
        uart0.receiverEnable = .on
        uart0.transmitterEnable = .on
        uart0.rxCompleteInterruptEnable = .on
        uart0.dataRegisterEmptyInterruptEnable = .off
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/available
    ///
    /// Get the number of bytes (characters) available for reading from the serial port.
    /// This is data that’s already arrived and stored in the serial receive buffer (which holds 64 bytes).
    ///
    /// - Returns: The number of bytes available to read.
    @inlinable
    @inline(__always)
    public static func available() -> UInt8 {
        return (Self.SERIAL_RX_BUFFER_SIZE + Self.rxBufferHead - Self.rxBufferTail) % Self.SERIAL_RX_BUFFER_SIZE
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/availableForWrite
    ///
    /// Get the number of bytes (characters) available for writing in the serial buffer without blocking the write operation.
    ///
    /// - Returns: The number of bytes available to write.
    @inlinable
    @inline(__always)
    public static func availableForWrite() -> UInt8 {
        return Self.txBufferHead >= Self.txBufferTail
            ? Self.SERIAL_TX_BUFFER_SIZE - 1 - Self.txBufferHead + Self.txBufferTail
            : Self.txBufferTail - Self.txBufferHead - 1
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/peek
    ///
    /// Returns the next byte (character) of incoming serial data without removing it from the internal serial buffer.
    /// That is, successive calls to `peek()` will return the same character, as will the next call to `read()`.
    ///
    /// - Returns: The first byte of incoming serial data available (or 255 if no data is available).
    @inlinable
    @inline(__always)
    public static func peek() -> UInt8 {
        return Self.rxBufferHead == Self.rxBufferTail
            ? UInt8.max
            : Self.rxBuffer[Int(Self.rxBufferTail)]
    }
    
    @inlinable
    @inline(__always)
    public static func read() -> UInt8 {
        guard Self.rxBufferHead != Self.rxBufferTail else { return UInt8.max }
        
        let character = Self.rxBuffer[Int(Self.rxBufferTail)]
        Self.rxBufferTail = (Self.rxBufferTail + 1) % Self.SERIAL_RX_BUFFER_SIZE
        
        return character
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/write
    ///
    /// Writes binary data to the serial port. This data is sent as a byte.
    ///
    /// - Parameters:
    /// - character: The ASCII Character to write to the Serial Port.
    @discardableResult
    @inline(never)
    public static func write(character: UInt8) -> UInt8 {
        Self.written = true
        
        if Self.txBufferHead == Self.txBufferTail && uart0.dataRegisterEmpty {
            atomic {
                uart0.USARTIODataRegister = character
                
                uart0.asynchronousDoubleSpeedMode = .on
                uart0.txComplete = true
            }
            
            return 1
        }
        
        let i: UInt8 = (Self.txBufferHead + 1) % Self.SERIAL_TX_BUFFER_SIZE
        
        while i == Self.txBufferTail {
            if !cpuCore.globalInterruptEnable {
                // Interrupts are disabled, poll data flag manually.
                // If set, pretend an interrupt has happened, and call the handler.
                dataRegisterEmptyInterruptHandler()
            }
        }
        
        Self.txBuffer[Int(Self.txBufferHead)] = character
        
        atomic {
            Self.txBufferHead = i
            uart0.dataRegisterEmptyInterruptEnable = .on
        }
        
        return 1
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/write
    ///
    /// Writes binary data to the serial port. This data is sent as a series of bytes.
    ///
    /// - Parameters:
    /// - buffer: The buffer to write to the Serial Port.
    /// - Returns: The amount of bytes written to Serial.
    @discardableResult
    @inlinable
    @inline(__always)
    public static func write(buffer: Array<UInt8>) -> UInt8 {
        var sent: UInt8 = 0
        for byte in buffer {
            if write(character: byte) == 1 {
                sent += 1
            }
        }
        
        return sent
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/write
    ///
    /// Writes binary data to the serial port. This data is sent as a string.
    ///
    /// - Parameters:
    /// - string: The buffer to write to the Serial Port.
    /// - Returns: The amount of bytes written to Serial.
    @discardableResult
    @inlinable
    @inline(__always)
    public static func write(string: StaticString) -> UInt8 {
        var sent: UInt8 = 0
        for character in string {
            if write(character: character) == 1 {
                sent += 1
            }
        }
        
        return sent
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/print
    ///
    /// Prints data to the serial port as human-readable ASCII text. This command can take many forms.
    /// Numbers are printed using an ASCII character for each digit.
    /// Floats are similarly printed as ASCII digits, defaulting to two decimal places.
    /// Bytes are sent as a single character.
    /// Characters and strings are sent as-is.
    ///
    /// - Parameters:
    /// - string: The string to print to Serial
    /// - Returns: The amount of bytes written to Serial.
    @discardableResult
    @inlinable
    @inline(__always)
    public static func print(_ string: StaticString) -> UInt8 {
        return Self.write(string: string)
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/print
    ///
    /// Prints data to the serial port as human-readable ASCII text. This command can take many forms.
    /// Numbers are printed using an ASCII character for each digit.
    /// Floats are similarly printed as ASCII digits, defaulting to two decimal places.
    /// Bytes are sent as a single character.
    /// Characters and strings are sent as-is.
    ///
    /// - Parameters:
    /// - character: The character to print to Serial
    /// - Returns: The amount of bytes written to Serial.
    @discardableResult
    @inlinable
    @inline(__always)
    public static func print(character: UInt8) -> UInt8 {
        return Self.write(character: character)
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/print
    ///
    /// Prints data to the serial port as human-readable ASCII text. This command can take many forms.
    /// Numbers are printed using an ASCII character for each digit.
    /// Floats are similarly printed as ASCII digits, defaulting to two decimal places.
    /// Bytes are sent as a single character.
    /// Characters and strings are sent as-is.
    ///
    /// - Parameters:
    /// - number: The number to print to Serial
    /// - base: The base of the number being printed (e.g. DEC, HEX, BIN, etc..)
    /// - Returns: The amount of bytes written to Serial.
    @discardableResult
    @inlinable
    @inline(__always)
    @available(*, deprecated, message: "Use Serial.print(Int32, NumberBase)")
    public static func print(_ number: Int32, _ base: UInt8) -> UInt8 {
        return Self.print(number: number, base: .init(rawValue: base) ?? .decimal)
    }
    
    
    /// Prints a number to the Serial port in a human-readable form.
    /// Numbers are printed using an ASCII character for each digit.
    ///
    /// - Parameters:
    /// - number: The number to print
    /// - base: The NumberBase of the number being printed (e.g. .decimal, .octal, ...)
    /// - Returns: The amount of bytes written to Serial.
    @discardableResult
    @inlinable
    @inline(__always)
    public static func print(number: Int32, base: NumberBase) -> UInt8 {
        if number < 0 && base == .decimal {
            let dash = Self.print("-")
            let number = -number
            
            return printNumber(number: number, base: .decimal) + dash
        }
        
        return printNumber(number: number, base: base)
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/println
    ///
    /// Prints data to the serial port as human-readable ASCII text followed by a line feed (ASCII 10, or '\n'). This command takes the same forms as Serial.print().
    ///
    /// - Parameters:
    /// - string: The string to print to Serial
    /// - Returns: The amount of bytes written to Serial.
    @discardableResult
    @inlinable
    @inline(__always)
    public static func println(_ string: StaticString) -> UInt8 {
        let written = Self.write(string: string)
        return written + Self.write(character: 0x0A)
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/println
    ///
    /// Prints a number to the Serial port in a human-readable form, followed by a line feed (ASCII 10, or '\n').
    /// Numbers are printed using an ASCII character for each digit.
    ///
    /// - Parameters:
    /// - number: The number to print
    /// - base: The NumberBase of the number being printed (e.g. .decimal, .octal, ...)
    /// - Returns: The amount of bytes written to Serial.
    @discardableResult
    @inlinable
    @inline(__always)
    @available(*, deprecated, message: "Use Serial.println(Int32, NumberBase)")
    public static func println(_ number: Int32, _ base: UInt8) -> UInt8 {
        let written = Self.print(number: number, base: .init(rawValue: base) ?? .decimal)
        return written + Self.write(character: 0x0A)
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/println
    ///
    /// Prints a number to the Serial port in a human-readable form, followed by a line feed (ASCII 10, or '\n').
    /// Numbers are printed using an ASCII character for each digit.
    ///
    /// - Parameters:
    /// - number: The number to print
    /// - base: The NumberBase of the number being printed (e.g. .decimal, .octal, ...)
    /// - Returns: The amount of bytes written to Serial.
    @discardableResult
    @inlinable
    @inline(__always)
    public static func println(number: Int32, base: NumberBase) -> UInt8 {
        let written = Self.print(number: number, base: base)
        return written + Self.write(character: 0x0A)
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/flush
    ///
    /// Waits for the transmission of outgoing serial data to complete.
    @inlinable
    @inline(__always)
    public static func flush() {
        guard Self.written else { return } // Return early if we've never written data to Serial before.
        
        while uart0.dataRegisterEmptyInterruptEnable == .on || !uart0.txComplete {
            // Interrupts are disabled; call dataRegisterEmpty manually to prevent deadlocks.
            if !cpuCore.globalInterruptEnable && uart0.dataRegisterEmptyInterruptEnable == .on {
                dataRegisterEmptyInterruptHandler()
            }
        }
    }
    
    /// Arduino Reference: Language/Functions/Communication/Serial/end
    ///
    /// Disables serial communication, allowing the RX and TX pins to be used for general input and output.
    /// To re-enable serial communication, call Serial.begin().
    @inlinable
    @inline(__always)
    public static func end() {
        Self.flush()
        
        uart0.receiverEnable = .off
        uart0.transmitterEnable = .off
        uart0.rxCompleteInterruptEnable = .off
        uart0.dataRegisterEmptyInterruptEnable = .off
        
        Self.rxBufferHead = Self.rxBufferTail
    }
    
    @inlinable
    @inline(always)
    public static func receiveCompleteInterruptHandler() {
        if uart0.parityError {
            // Read byte and discard it.
            let _ = uart0.USARTIODataRegister
            return
        }
        
        let character = uart0.USARTIODataRegister
        let index = (Self.rxBufferHead + 1) % Self.SERIAL_RX_BUFFER_SIZE
        
        if index != Self.rxBufferTail {
            Self.rxBuffer[Int(Self.rxBufferHead)] = character
            Self.rxBufferHead = index
        }
    }
    
    @inlinable
    @inline(always)
    public static func dataRegisterEmptyInterruptHandler() {
        let character: UInt8 = Self.txBuffer[Int(Self.txBufferTail)]
        Self.txBufferTail = (Self.txBufferTail + 1) % Self.SERIAL_TX_BUFFER_SIZE
        
        uart0.USARTIODataRegister = character
        uart0.asynchronousDoubleSpeedMode = .on
        uart0.txComplete = true
        
        if Self.txBufferHead == Self.txBufferTail {
            uart0.dataRegisterEmptyInterruptEnable = .off
        }
    }
    
    // TODO: Fix negative hex print.
    @discardableResult
    @inlinable
    @inline(__always)
    internal static func printNumber(number: Int32, base: NumberBase) -> UInt8 {
        var number: Int32 = number
        
        var buffer = ConstantSizeBuffer<UInt8>.init(count: (Int32.bitWidth / 8), repeating: 0)
        var index: UInt8 = UInt8((Int32.bitWidth / 8) - 1)
        
        repeat {
            let character: Int8 = Int8(number % Int32(base.rawValue))
            number /= Int32(base.rawValue)
            
            buffer[Int(index)] = UInt8(character < 10 ? character + 0x30 : character + 0x41 - 10) // 0x30 = ASCII '0'; 0x41 = ASCII 'A'
            index -= 1
        } while number != 0
        
        return write(buffer: buffer, ignoreZeroBytes: true)
    }
    
    @discardableResult
    @inlinable
    @inline(__always)
    internal static func write(buffer: borrowing ConstantSizeBuffer<UInt8>, ignoreZeroBytes: Bool = false) -> UInt8 {
        var sent: UInt8 = 0
        for i in 0..<buffer.count {
            if ignoreZeroBytes && buffer[i] == 0x00 { continue }
            if write(character: buffer[i]) == 1 {
                sent += 1
            }
        }
        
        return sent
    }
}
