//
//  Characters.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-10-29.
//

/// Arduino Reference: Language/Functions/Characters/isAlpha
///
/// Analyses if a char is alpha (that it is a letter). Return true if `character` is a letter.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is a letter
@inlinable
@inline(__always)
public func isAlpha(character: UInt8) -> Bool {
    return isUpperCase(character: character) || isLowerCase(character: character)
}

/// Arduino Reference: Language/Functions/Characters/isAlphaNumeric
///
/// Analyses if a char is alphanumeric (that it is a letter or a number). Return true if `character` contains either a letter or a number.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is a letter or number
@inlinable
@inline(__always)
public func isAlphaNumeric(character: UInt8) -> Bool {
    return isAlpha(character: character) || isDigit(character: character)
}

/// Arduino Reference: Language/Functions/Characters/isAscii
///
/// Analyses if a char is an ASCII character.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is an ASCII character
@inlinable
@inline(__always)
public func isAscii(character: UInt8) -> Bool {
    return (character & ~0b01111111) == 0
}

/// Arduino Reference: Language/Functions/Characters/isControl
///
/// Analyses if a char is a control character.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is an ASCII Control Character.
@inlinable
@inline(__always)
public func isControl(character: UInt8) -> Bool {
    return character < 0x20 || character == 0x7F // Detected everything up to Space (0x20), and DEL (0x7F)
}

/// Arduino Reference: Language/Functions/Characters/isDigit
///
/// Analyses if a char is a digit.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is a number.
@inlinable
@inline(__always)
public func isDigit(character: UInt8) -> Bool {
    return character >= 0x30 && character <= 0x39
}

/// Arduino Reference: Language/Functions/Characters/isGraph
///
/// Analyses if a char is printable with some content (space is printable but has no content).
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is printable.
@inlinable
@inline(__always)
public func isGraph(character: UInt8) -> Bool {
    return isPrintable(character: character) && isWhitespace(character: character)
}

/// Arduino Reference: Language/Functions/Characters/isHexadecimalDigit
///
/// Analyses if a char is a hexidecimal digit.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is a hex digit.
@inlinable
@inline(__always)
public func isHexadecimalDigit(character: UInt8) -> Bool {
    return isDigit(character: character) || (character >= 0x41 && character <= 0x46) || (character >= 0x61 && character <= 0x66)
}

/// Arduino Reference: Language/Functions/Characters/isLowerCase
///
/// Analyses if a char is lowercase.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is in lowercase.
@inlinable
@inline(__always)
public func isLowerCase(character: UInt8) -> Bool {
    return character >= 0x61 && character <= 0x7A
}

/// Arduino Reference: Language/Functions/Characters/isPrintable
///
/// Analyses if a char is printable.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is printable.
@inlinable
@inline(__always)
public func isPrintable(character: UInt8) -> Bool {
    return character >= 0x20 && character <= 0x7E
}

/// Arduino Reference: Language/Functions/Characters/isPunct
///
/// Analyses if a char is punctuation (that is a comma, semicolon, exclamation point, etc.).
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is punctuation.
@inlinable
@inline(__always)
public func isPunct(character: UInt8) -> Bool {
    if character < 0x21 || character > 0x7E { return false } // Outside printable ASCII
    if isAlphaNumeric(character: character) { return false } // Alphanumeric
    if character == 0x20 { return false }                    // Space
    
    return true
}

/// Arduino Reference: Language/Functions/Characters/isSpace
///
/// Analyses if a char is a white-space character.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is a white-space character.
@inlinable
@inline(__always)
@available(*, deprecated, message: "Use Swift's builtin `Character.isWhitespace` property instead.")
public func isSpace(character: UInt8) -> Bool {
    return character == 0x20 || (character >= 0x09 && character <= 0x0D)

}

/// Arduino Reference: Language/Functions/Characters/isUpperCase
///
/// Analyses if a char is uppercase.
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is in uppercase.
@inlinable
@inline(__always)
public func isUpperCase(character: UInt8) -> Bool {
    return character >= 0x41 && character <= 0x5A
}

/// Arduino Reference: Language/Functions/Characters/isWhitespace
///
/// Analyses if a char is a space character (e.g. ' ' and '\t').
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is a space character.
@inlinable
@inline(__always)
public func isWhitespace(character: UInt8) -> Bool {
    return character == 0x09 || character == 0x20 // 0x09 = '\t', 0x20 = ' '
}
