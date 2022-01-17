//
//  Castable.swift
//  Protful
//
//  Created by Kiarash Vosough on 1/15/22.
//
//  Copyright 2022 KiarashVosough and other contributors
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

infix operator ->>: DefaultPrecedence

public protocol Castable {
    
    func forceCast<U>(to type: U.Type) -> U
    
    func AS<U>(to type: U.Type) -> U?
    
    func cast<U>(to type: U.Type) -> U?
    
    func unsafeBitCast<U>(to type: U.Type) throws -> U
    
    func unsafeDownCast<U>(to type: U.Type) throws -> U where U: AnyObject
    
    static func ->> <U>(lhs: Self, rhs: U.Type) -> U?
    
}

public extension Castable where Self: AnyObject {
    
    func unsafeDownCast<U>(to type: U.Type) throws -> U where U: AnyObject {
        Swift.unsafeDowncast(self, to: type.self)
    }
}

public extension Castable {
    
    func isReferenceType() -> Bool {
        return Swift.type(of: self) is AnyClass
    }
    
    static func ->> <U>(lhs: Self, rhs: U.Type) -> U? {
        lhs as? U
    }
    
    func forceCast<U>(to type: U.Type) -> U {
        self as! U
    }
    
    func AS<U>(to type: U.Type) -> U? {
        self as? U
    }
    
    func cast<U>(to type: U.Type) -> U? {
        self as? U
    }
    
    func unsafeBitCast<U>(to type: U.Type) throws -> U {
        if MemoryLayout<Self>.size != MemoryLayout<U>.size{
            throw ProtoError.castingError(reason: .bitcastTwoVariableWithDifferentBitCount)
        }
        
        return Swift.unsafeBitCast(self, to: U.self)
    }
    
    func unsafeDownCast<U>(to type: U.Type) throws -> U where U: AnyObject {
        throw ProtoError.castingError(reason: .downCastingNonRefrencableVariable)
    }
}

extension NSObject: Castable {}
