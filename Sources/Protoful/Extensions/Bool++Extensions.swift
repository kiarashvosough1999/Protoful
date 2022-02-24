//
//  Bool++Extensions.swift
//  
//
//  Created by Kiarash Vosough on 2/24/22.
//

import Foundation

extension Bool: BooleanOperator {
    
    public var not: Bool { !self }
    
    public var isTrue: Bool { self == true }
    
    public var isFalse: Bool { self == false }
    
    @inlinable
    public func and(_ expression: @autoclosure () -> Bool) -> Bool {
        self && expression()
    }
    
    @inlinable
    public func nand(_ expression: @autoclosure () -> Bool) -> Bool {
        (self && expression()).not
    }
    
    @inlinable
    public func or(_ expression: @autoclosure () -> Bool) -> Bool {
        self || expression()
    }
    
    @inlinable
    public func nor(_ expression: @autoclosure () -> Bool) -> Bool {
        (self || expression()).not
    }
    
    @inlinable
    public func xor(_ expression: @autoclosure () -> Bool) -> Bool {
        self != expression()
    }
    
    @inlinable
    public func xnor(_ expression: @autoclosure () -> Bool) -> Bool {
        (self != expression()).not
    }
    
    public func convertToBooleanLiteral() -> Bool {
        self
    }
}
