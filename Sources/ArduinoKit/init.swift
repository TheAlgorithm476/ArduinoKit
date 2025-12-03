//
//  init.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-11-25.
//

import CoreAVR

/// ArduinoKit Initialization Function.
///
/// This function should be called before any other ArduinoKit function is called.
@inlinable
@inline(__always)
public func initializeArduino() {
    // Enable Interrupts
    // TODO: Rename to Interrupts.enable()?
    Interrupts.enableInterrupts()
    
    // Set up Timer 0
    timer0.waveformGenerationMode = .fastPWM
    timer0.prescaler = .running64
    timer0.overflowInterruptEnable = true
    
    // Set up Timer 1
    timer1.waveformGenerationMode = .phaseCorrectPWM8Bit
    timer1.prescaler = .running64
    
    // Set up Timer 2
    timer2.waveformGenerationMode = .phaseCorrectPWM
    timer2.prescaler = .runningSixtyFour // TODO: Rename to .running64 once HALGEN merges
    
    // Set up ADC
    adc.prescaler = .divide128
    adc.enabled = true
    
    // TODO: Improve this logic, just clearing the register is not something I'd like to "just do".
    // Disconnect UART for use in Digital IO (Serial.begin will re-enable them)
    uart0.USARTControlAndStatusRegisterB = 0
}
