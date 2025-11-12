//
//  Print.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-04.
//

@available(*, deprecated, message: "Use NumberBase.decimal instead.")
public let DEC: UInt8 = 10
@available(*, deprecated, message: "Use NumberBase.hexadecimal instead.")
public let HEX: UInt8 = 16
@available(*, deprecated, message: "Use NumberBase.octal instead.")
public let OCT: UInt8 = 8
@available(*, deprecated, message: "Use NumberBase.binary instead.")
public let BIN: UInt8 = 2

public enum NumberBase: UInt8 {
    case binary = 2
    case octal = 8
    case decimal = 10
    case hexadecimal = 16
}

/// Arduino Reference: Language/Functions/Communication/Print
///
/// The Print Protocol is a protocol that provides a common interface for printing data to different output devices. It defines several functions that allow printing data in different formats.
///
/// The Print protocol is related to several libraries in ArduinoKit that use the printing functionality to interact with devices such as Serial Monitors, LCD Screens, printers, etc.
protocol Print {
    // TODO: Protocol stub
}
