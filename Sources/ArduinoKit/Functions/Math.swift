//
//  Math.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-10-27.
//

/// Arduino Reference: Language/Functions/Math/abs
///
/// Calculates the absolute value of a number.
///
/// - Parameters:
/// - x: The number
/// - Returns: `x` if `x` is greater than 0, `-x` otherwise.
@inlinable
@inline(__always)
public func abs<T: SignedNumeric>(_ x: T) -> T {
    return x > 0 ? x : -x
}

/// Arduino Reference: Language/Functions/Math/constrain
///
/// Constrains a number to be within a range.
///
/// - Parameters:
/// - amount: The number to constrain
/// - min: The lower bound of the range
/// - max: The upper bound of the range
/// - Returns: If amount if lower than `min`: min; if higher than `max`: max; `amount` otherwise.
@inlinable
@inline(__always)
public func constrain<T: Comparable>(_ amount: T, _ min: T, _ max: T) -> T {
    return (amount < min) ? min : ((amount > max) ? max : amount)
}

/// Arduino Reference: Language/Functions/Math/map
///
/// Re-maps a number from one range to another. That is, a value of `minInput` would get mapped to `minOutput`, a value of `maxInput` to `maxOutput`, values in-between to values in-between, etc.
///
/// Does not constrain values to within the range, because out-of-range values are sometimes intended and useful. The `constrain()` function may be used either before or after this function, if limits to the ranges are desired.
///
/// - Parameters:
/// - input: The number to map
/// - minInput: The lower bound of the value's current range
/// - maxInput: The upper bound of the value's current range
/// - minOutput: The lower bound of the value's target range
/// - maxOutput: The upper bound of the value's target range
/// - Returns: The mapped value.
@inlinable
@inline(__always)
public func map<T: BinaryInteger>(_ input: T, _ minInput: T, _ maxInput: T, _ minOutput: T, _ maxOutput: T) -> T {
    return (input - minInput) * (maxOutput - minOutput) / (maxInput - minInput) + minOutput
}

/// Arduino Reference: Language/Functions/Math/map
///
/// Re-maps a number from one range to another. That is, a value of `minInput` would get mapped to `minOutput`, a value of `maxInput` to `maxOutput`, values in-between to values in-between, etc.
///
/// Does not constrain values to within the range, because out-of-range values are sometimes intended and useful. The `constrain()` function may be used either before or after this function, if limits to the ranges are desired.
///
/// - Parameters:
/// - input: The number to map
/// - minInput: The lower bound of the value's current range
/// - maxInput: The upper bound of the value's current range
/// - minOutput: The lower bound of the value's target range
/// - maxOutput: The upper bound of the value's target range
/// - Returns: The mapped value.
@inlinable
@inline(__always)
public func map<T: FloatingPoint>(_ input: T, _ minInput: T, _ maxInput: T, _ minOutput: T, _ maxOutput: T) -> T {
    return (input - minInput) * (maxOutput - minOutput) / (maxInput - minInput) + minOutput
}

/// Arduino Reference: Language/Functions/Math/min
///
/// Calculates the minimum of two numbers.
///
/// - Parameters:
/// - a: The first number
/// - b: The second number
/// - Returns: The smaller of the 2 values
@inlinable
@inline(__always)
public func min<T: Comparable>(_ a: T, _ b: T) -> T {
    return (a < b) ? a : b;
}

/// Arduino Reference: Language/Functions/Math/max
///
/// Calculates the maximum of two numbers.
///
/// - Parameters:
/// - a: The first number
/// - b: The second number
/// - Returns: The larger of the 2 values
@inlinable
@inline(__always)
public func max<T: Comparable>(_ a: T, _ b: T) -> T {
    return (b < a) ? a : b;
}

// TODO: pow

/// Arduino Reference: Language/Functions/Math/sq
///
/// Calculates the square of a number: the number multiplied by itself.
///
/// - Parameters:
/// - x: the number
/// - Returns: The square of the number.
@inlinable
@inline(__always)
public func sq<T: Numeric>(_ x: T) -> T {
    return x * x
}

// TODO: sqrt
