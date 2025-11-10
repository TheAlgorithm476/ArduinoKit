//
//  Utils.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-10-24.
//

import CoreAVR

// ArduinoKit Utility Functions
// These functions aren't part of ArduinoKit itself, but abstract away some of the more complex logic used repeatedly, like Atomic operations.

/// Derived from: avr-libc/include/util/atomic.h - ATOMIC_BLOCK
///
/// Creates a block of code that is guaranteed to be executed atomically.
/// Upon entering the block the Global Interrupt Status flag in SREG is disabled, and re-enabled upon exiting the block from any exit path.
@inlinable
@inline(__always)
internal func atomic(block: () -> Void) {
    let interruptsEnabled = cpuCore.globalInterruptEnable
    if interruptsEnabled { Interrupts.disableInterrupts() }
    
    block()
    
    if interruptsEnabled { Interrupts.enableInterrupts() }
}

// https://stackoverflow.com/a/62735799
@usableFromInline
internal class ConstantSizeBuffer<T>: ExpressibleByArrayLiteral {
    @usableFromInline
    typealias ArrayLiteralElement = T
    
    private let memory: UnsafeMutableBufferPointer<T>
    
    public var startIndex: Int { 0 }
    public var endIndex: Int { self.count - 1 }
    
    public var count: Int {
        get { memory.count }
    }
    
    private init(_ count: Int) {
        self.memory = UnsafeMutableBufferPointer.allocate(capacity: count)!
    }
    
    public convenience init(count: Int, repeating value: T) {
        self.init(count)
        memory.initialize(repeating: value)
    }
    
    public required convenience init(arrayLiteral: ArrayLiteralElement...) {
        self.init(arrayLiteral.count)
        let _ = memory.initialize(from: arrayLiteral)
    }
    
    deinit {
        memory.deallocate()
    }
    
    public subscript(index: Int) -> T {
        get {
            precondition((startIndex...endIndex).contains(index))
            return memory[index]
        }
        set {
            precondition((startIndex...endIndex).contains(index))
            memory[index] = newValue
        }
    }
}
