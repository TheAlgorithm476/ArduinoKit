//
//  Stream.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-04.
//

/// Arduino Reference: Language/Functions/Communication/Stream
///
/// Stream is the base protocol for character and binary based streams. It is not called directly, but invoked whenever you use a function that relies on it.
///
/// Stream defines the reading functions in ArduinoKit. When using any core functionality that uses a `read()` or similar function, you can safely assume it relies on the Stream protocol. For functions like `print()`, Stream inherits from the `Print` protocol.
protocol Stream: Print {
    // TODO: Protocol stub
}
