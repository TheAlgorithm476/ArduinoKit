// ----------------------------------
// | AK_Interrupts.swift            |
// | ArduinoKit (User Project Side) |
// |                                |
// | Last Update: 2026-02-16        |
// ----------------------------------

// This file is part of the ArduinoKit project, but must be placed in your project directory.
// Library code within S4A Projects cannot define Interrupts, and instead relies on the user to include them in the project.
// Not including this file will cause Interrupt-driven features, such as Serial communication, and timer-related
// functionality to stop working correctly.

import ArduinoKit

@inline(never)
@interruptHandler
@_silgen_name("__vector_16")
func AK_Interrupt16() {
    vector16()
}

@inline(never)
@interruptHandler
@_silgen_name("__vector_18")
func AK_Interrupt18() {
    vector18()
}

@inline(never)
@interruptHandler
@_silgen_name("__vector_19")
func AK_Interrupt19() {
    vector19()
}
