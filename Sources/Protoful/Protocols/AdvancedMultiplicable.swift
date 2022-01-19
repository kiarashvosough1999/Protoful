//
//  AdvancedMultiplicable.swift
//  Protful
//
//  Created by Kiarash Vosough on 1/19/22.
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
import CoreGraphics

public protocol AdvancedMultiplicable {
    func multiply(_ any: Self) -> Self
    func square() -> Self
}

public extension AdvancedMultiplicable where Self: FloatingPoint {
    
    func multiply(_ any: Self) -> Self {
        self * any
    }
    
    func square() -> Self {
        self * self
    }
}

public extension AdvancedMultiplicable where Self: BinaryInteger {
    
    func multiply(_ any: Self) -> Self {
        self * any
    }
    
    func square() -> Self {
        self * self
    }
}

// MARK: - Primitive types

extension Double: AdvancedMultiplicable {}

extension Float: AdvancedMultiplicable {}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension Float16: AdvancedMultiplicable {}

extension CGFloat: AdvancedMultiplicable {}

extension Int: AdvancedMultiplicable {}

extension Int8: AdvancedMultiplicable {}

extension Int32: AdvancedMultiplicable {}

extension Int64: AdvancedMultiplicable {}

extension UInt: AdvancedMultiplicable {}

extension UInt8: AdvancedMultiplicable {}

extension UInt32: AdvancedMultiplicable {}

extension UInt64: AdvancedMultiplicable {}
