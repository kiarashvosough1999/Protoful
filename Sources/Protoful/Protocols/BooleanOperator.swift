//
//  BooleanOperator.swift
//  
//
//  Created by Kiarash Vosough on 2/24/22.
//

import Foundation

public protocol BooleanOperator: Equatable {
    
    var not: Self { get }
    
    var isTrue: Self { get }
    
    var isFalse: Self { get }
    
    @inlinable
    func convertToBooleanLiteral() -> Bool
    
    @inlinable
    func and(_ expression: @autoclosure () -> Self) -> Self
    
    @inlinable
    func nand(_ expression: @autoclosure () -> Self) -> Self
    
    @inlinable
    func or(_ expression: @autoclosure () -> Self) -> Self
    
    @inlinable
    func nor(_ expression: @autoclosure () -> Self) -> Self
    
    @inlinable
    func xor(_ expression: @autoclosure () -> Self) -> Self
    
    @inlinable
    func xnor(_ expression: @autoclosure () -> Self) -> Self
    
    @inlinable
    func evaluate(satisfied on: () -> Void, otherwise: () -> Void)
}

extension BooleanOperator {
    
    @inlinable
    public func evaluate(satisfied on: () -> Void, otherwise: () -> Void) {
        if self.convertToBooleanLiteral() {
            on()
        } else {
            otherwise()
        }
    }
}

@inlinable
public func evaluate<T>(_ expression: @autoclosure () -> T, satisfied on: () -> Void, otherwise: () -> Void) where T: BooleanOperator {
    if expression().convertToBooleanLiteral() {
        on()
    } else {
        otherwise()
    }
}
