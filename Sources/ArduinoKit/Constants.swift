//
//  Constants.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-10-24.
//

// Note: Arduino Reference mentioned "A pin may also be configured as an INPUT", before talking about writing to it
// I'm assuming they meant "OUTPUT", and I changed the reference.
/// Arduino Reference: Language/Variables/Constants/highLow
///
/// The meaning of `HIGH` (in reference to a pin) is somewhat different depending on whether a pin is set to an `INPUT` or `OUTPUT`. When a pin is configured as an `INPUT` with `pinMode()`, and read with `digitalRead()`, the Arduino (ATmega) will report `HIGH` if:
/// - a voltage greater than 3.0V is present at the pin (5V boards)
/// - a voltage greater than 2.0V is present at the pin (3.3V boards)
///
/// A pin may also be configured as an `OUTPUT` with `pinMode()`, and subsequently made `HIGH` with `digitalWrite()`. This will enable the internal 20K pullup resistors, which will pull up the input pin to a `HIGH` reading unless it is pulled `LOW` by external circuitry. This can be done alternatively by passing `INPUT_PULLUP` as argument to the `pinMode()` function, as explained in more detail in the section "Defining Digital Pins modes: INPUT, INPUT\_PULLUP, and OUTPUT" further below.
///
/// When a pin is configured to `OUTPUT` with `pinMode()`, and set to `HIGH` with `digitalWrite(),` the pin is at:
/// - 5 volts (5V boards)
/// - 3.3 volts (3.3V boards)
///
/// In this state it can source current, e.g. light an LED that is connected through a series resistor to ground.
@available(*, deprecated, message: "Use CoreAVR's builtin `DigitalValue.high` constant instead.")
public let HIGH: UInt8 = 0x01

/// Arduino Reference: Language/Variables/Constants/highLow
///
/// The meaning of `LOW` also has a different meaning depending on whether a pin is set to `INPUT` or `OUTPUT`. When a pin is configured as an `INPUT` with `pinMode()`, and read with `digitalRead()`, the Arduino (ATmega) will report `LOW` if:
/// - a voltage less than 1.5V is present at the pin (5V boards)
/// - a voltage less than 1.0V (Approx) is present at the pin (3.3V boards)
///
/// When a pin is configured to `OUTPUT` with `pinMode()`, and set to `LOW` with `digitalWrite()`, the pin is at 0 volts (both 5V and 3.3V boards). In this state it can sink current, e.g. light an LED that is connected through a series resistor to +5 volts (or +3.3 volts).
@available(*, deprecated, message: "Use CoreAVR's builtin `DigitalValue.low` constant instead.")
public let LOW: UInt8 = 0x00


/// Arduino Reference: Language/Variables/Constants/inputOutputPullup
///
/// Arduino (ATmega) pins configured as `INPUT` with `pinMode()` are said to be in a *high-impedance* state. Pins configured as `INPUT` make extremely small demands on the circuit that they are sampling, equivalent to a series resistor of 100 Megohms in front of the pin. This makes them useful for reading a sensor.
///
/// If you have your pin configured as an `INPUT`, and are reading a switch, when the switch is in the open state the input pin will be "floating", resulting in unpredictable results. In order to assure a proper reading when the switch is open, a pull-up or pull-down resistor must be used. The purpose of this resistor is to pull the pin to a known state when the switch is open. A 10 K ohm resistor is usually chosen, as it is a low enough value to reliably prevent a floating input, and at the same time a high enough value to not draw too much current when the switch is closed. See the Digital Read Serial tutorial for more information.
///
/// If a pull-down resistor is used, the input pin will be `LOW` when the switch is open and `HIGH` when the switch is closed.
///
/// If a pull-up resistor is used, the input pin will be HIGH when the switch is open and LOW when the switch is closed.
@available(*, deprecated, message: "Use CoreAVR's builtin `DataDirectionFlag.input` constant instead.")
public let INPUT: UInt8 = 0x00

/// Arduino Reference: Language/Variables/Constants/inputOutputPullup
///
/// Pins configured as `OUTPUT` with `pinMode()` are said to be in a *low-impedance* state. This means that they can provide a substantial amount of current to the other circuits. ATmega pins can source (provide current) or sink (absorb current) up to 40 mA (milliamps) of current to other devices/circuits. This makes them useful for powering LEDs because LEDs typically use less than 40 mA. Loads greater than 40 mA (e.g. motors) will require a transistor or other interface circuitry.
///
/// Pins configured as outputs can be damaged or destroyed if they are connected to either the ground or positive power rails.
@available(*, deprecated, message: "Use CoreAVR's builtin `DataDirectionFlag.output` constant instead.")
public let OUTPUT: UInt8 = 0x01

/// Arduino Reference: Language/Variables/Constants/inputOutputPullup
///
/// The ATmega microcontroller on the Arduino has internal pull-up resistors (resistors that connect to power internally) that you can access. If you prefer to use these instead of external pull-up resistors, you can use the `INPUT_PULLUP` argument in `pinMode()`.
///
/// See the Input Pullup Serial tutorial for an example of this in use.
///
/// Pins configured as inputs with either `INPUT` or `INPUT_PULLUP` can be damaged or destroyed if they are connected to voltages below ground (negative voltages) or above the positive power rail (5V or 3V).
public let INPUT_PULLUP: UInt8 = 0x02
