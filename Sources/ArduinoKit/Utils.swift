//
//  Utils.swift
//  ArduinoKit
//
//  Created by Brent Van den Abbeel on 2025-10-24.
//

import CoreAVR

// ArduinoKit Utility Functions
// These functions aren't part of ArduinoKit itself, but abstract away some of the more complex logic used repeatedly, like Atomic operations, or Constant Size Buffers.

/// Derived from: StackOverflow - https://stackoverflow.com/a/62735799
///
/// Allocates a managed buffer with a fixed size.
// This is awaiting Swift 6.2's Inline Arrays.
@usableFromInline
internal struct ConstantSizeBuffer<T>: ~Copyable {
    private var memory: UnsafeMutableBufferPointer<T>
    
    public var startIndex: Int { 0 }
    public var endIndex: Int { self.count - 1 }
    
    public var count: Int {
        get { memory.count }
    }
    
    public init(count: Int, repeating value: T) {
        self.memory = UnsafeMutableBufferPointer.allocate(capacity: count)!
        memory.initialize(repeating: value)
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
