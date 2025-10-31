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
@available(*, deprecated, message: "Use Swift's builtin `Character.isLetter` property instead.")
public func isAlpha(character: Character) -> Bool {
    return character.isLetter
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
public func isAlphaNumeric(character: Character) -> Bool {
    return character.isLetter || character.isNumber
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
@available(*, deprecated, message: "Use Swift's builtin `Character.isASCII` property instead.")
public func isAscii(character: Character) -> Bool {
    return character.isASCII
}

/// Arduino Reference: Language/Functions/Characters/isControl
///
/// Analyses if a char is a control character.
/// WARNING: This function will only work on ASCII characters, and will fail to detect Unicode control characters!
///
/// - Parameters:
/// - character: The character to check
/// - Returns: Whether or not `character` is an ASCII Control Character.
@inlinable
@inline(__always)
public func isControl(character: Character) -> Bool {
    guard let scalar = character.unicodeScalars.first else { return false }
    let value = scalar.value
    return (value <= 0x1F) || (value >= 0x7F && value <= 0x9F)
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
@available(*, deprecated, message: "Use Swift's builtin `Character.isNumber` property instead.")
public func isDigit(character: Character) -> Bool {
    return character.isNumber
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
public func isGraph(character: Character) -> Bool {
    return isPrintable(character: character) && !character.isWhitespace
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
@available(*, deprecated, message: "Use Swift's builtin `Character.isHexDigit` property instead.")
public func isHexadecimalDigit(character: Character) -> Bool {
    return character.isHexDigit
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
@available(*, deprecated, message: "Use Swift's builtin `Character.isLowercase` property instead.")
public func isLowerCase(character: Character) -> Bool {
    return character.isLowercase
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
public func isPrintable(character: Character) -> Bool {
    guard let scalar = character.unicodeScalars.first else { return false }
    let value = scalar.value
    return value <= 0x7F && (value - 0x20) < 0x5F
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
@available(*, deprecated, message: "Use Swift's builtin `Character.isPunctuation` property instead.")
public func isPunct(character: Character) -> Bool {
    return character.isPunctuation
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
public func isSpace(character: Character) -> Bool {
    return character.isWhitespace
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
@available(*, deprecated, message: "Use Swift's builtin `Character.isUppercase` property instead.")
public func isUpperCase(character: Character) -> Bool {
    return character.isUppercase
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
public func isWhitespace(character: Character) -> Bool {
    return character == " " || character == "\t"
}
