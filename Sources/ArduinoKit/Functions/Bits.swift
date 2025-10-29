//
//  Bits.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-10-28.
//

/// Arduino Reference: Language/Functions/Bits and Bytes/bit
///
/// Computes the value of the specified bit (bit 0 is 1, bit 1 is 2, bit 2 is 4, etc.).
///
/// - Parameters:
/// - n: the bit whose value to compute. Note that `n` needs to be between 0 and 31 (32-bit).
/// - Returns: The value of the bit
@inlinable
@inline(__always)
public func bit(n: UInt8) -> UInt32 {
    return 1 << n
}

/// Arduino Reference: Language/Functions/Bits and Bytes/bitClear
///
/// Clears (writes a 0 to) a bit of a numeric variable.
///
/// - Parameters:
/// - value: the numeric value whose bit to clear
/// - bit: which bit to clear, starting at 0 for the least-significant (rightmost) bit.
/// - Returns: The value of the variable after the bit is cleared.
@inlinable
@inline(__always)
public func bitClear(value: UInt8, bit: UInt8) -> UInt8 {
    return value & ~(1 << bit)
}

/// Arduino Reference: Language/Functions/Bits and Bytes/bitRead
///
/// Reads a bit of a variable.
///
/// - Parameters:
/// - value: the numeric value whose bit to read
/// - bit: which bit to read, starting at 0 for the least-significant (rightmost) bit.
/// - Returns: `true` if the bit is 1, `false` otherwise.
@inlinable
@inline(__always)
public func bitRead(value: UInt8, bit: UInt8) -> Bool {
    return (value >> bit) & 0b00000001 == 1
}

/// Arduino Reference: Language/Functions/Bits and Bytes/bitSet
///
/// Sets (writes a 1 to) a bit of a numeric variable.
///
/// - Parameters:
/// - value: the numeric value whose bit to set
/// - bit: which bit to set, starting at 0 for the least-significant (rightmost) bit.
/// - Returns: The value of the variable after the bit is set.
@inlinable
@inline(__always)
public func bitSet(value: UInt8, bit: UInt8) -> UInt8 {
    return value | (1 << bit)
}

/// Arduino Reference: Language/Functions/Bits and Bytes/bitWrite
///
/// Writes to a bit of a variable.
///
/// - Parameters:
/// - number: the numeric variable whose bit to set
/// - bit: which bit to write, starting at 0 for the least-significant (rightmost) bit.
/// - value: Whether or not the bit should be set to 1 (`true`) or 0 (`false`).
/// - Returns: The value of the variable after the bit is written.
@inlinable
@inline(__always)
public func bitWrite(number: UInt8, bit: UInt8, value: Bool) -> UInt8 {
    return value ? bitSet(value: number, bit: bit) : bitClear(value: number, bit: bit)
}

/// Arduino Reference: Language/Functions/Bits and Bytes/highByte
///
/// Extracts the high-order (leftmost) byte or a word.
///
/// - Parameters:
/// - value: The integer from which to extract the high byte.
/// - Returns: The high byte.
@inlinable
@inline(__always)
public func highByte<T: BinaryInteger>(value: T) -> UInt8 {
    return UInt8(value >> (value.bitWidth - 8))
}

/// Arduino Reference: Language/Functions/Bits and Bytes/lowByte
///
/// Extracts the low-order (rightmost) byte or a word.
///
/// - Parameters:
/// - value: The integer from which to extract the low byte.
/// - Returns: The low byte.
@inlinable
@inline(__always)
public func lowByte<T: BinaryInteger>(value: T) -> UInt8 {
    return UInt8(value & 0b11111111)
}
