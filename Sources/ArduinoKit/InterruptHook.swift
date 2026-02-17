//
//  InterruptHook.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2026-02-16.
//
// TODO: Future optimization: Inline?
        
public func vector16() {
    timer0OverflowInterruptHandler()
}

public func vector18() {
    Serial.receiveCompleteInterruptHandler()
}

public func vector19() {
    Serial.dataRegisterEmptyInterruptHandler()
}
