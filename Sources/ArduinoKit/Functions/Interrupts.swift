//
//  Interrupts.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-10-31.
//

import CoreAVR

// TODO: Parity with ArduinoCore?
/// Arduino Reference: Language/Functions/Interrupts/interrupts
///
/// Enables Interrupts. Interrupts allow certain tasks to happen in the background, and are disabled by default.
/// Interrupts can disrupt the timing of code, and should be handled with care.
/// If you don't know why you're enabling them, you probably don't need them, and should leave them disabled.
@inlinable
@inline(__always)
@available(*, deprecated, message: "Use CoreAVR's builtin `Interrupts.enableInterrupts` function instead.")
func interrupts() {
    Interrupts.enableInterrupts()
}

// TODO: Parity with ArduinoCore?
/// Arduino Reference: Language/Functions/Interrupts/noInterrupts
///
/// Disables Interrupts. Interrupts allow certain tasks to happen in the background, and are disabled by default.
/// Interrupts can disrupt the timing of code, and should be handled with care.
/// If you don't know why you're enabling them, you probably don't need them, and should leave them disabled.
@inlinable
@inline(__always)
@available(*, deprecated, message: "Use CoreAVR's builtin `Interrupts.disableInterrupts` function instead.")
func noInterrupts() {
    Interrupts.disableInterrupts()
}
