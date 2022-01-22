//
//  AdvancedDivision.swift
//  Protful
//
//  Created by Kiarash Vosough on 1/20/22.
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

public protocol AdvancedDivision {
    func divide(_ any: Self) -> Self
    func divide(_ any: Self, replaceZeroWith divisionable: @autoclosure () -> Self) -> Self
}

public extension AdvancedDivision where Self: BinaryFloatingPoint {
    
    func divide(_ any: Self) -> Self {
        precondition(any != .zero, "The divisor must not be equal to zero")
        return self / any
    }
    
    func divide(_ any: Self, replaceZeroWith divisionable: @autoclosure () -> Self) -> Self {
        if any == .zero { return self / divisionable() }
        return self / any
    }
}

public extension AdvancedDivision where Self: BinaryInteger {
    
    func divide(_ any: Self) -> Self {
        precondition(any != .zero, "The divisor must not be equal to zero")
        return self / any
    }
    
    func divide(_ any: Self, replaceZeroWith divisionable: @autoclosure () -> Self) -> Self {
        if any == .zero { return self / divisionable() }
        return self / any
    }
}

// MARK: - Primitive types

extension Double: AdvancedDivision {}

extension Float: AdvancedDivision {}

@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension Float16: AdvancedDivision {}

extension CGFloat: AdvancedDivision {}

extension Int: AdvancedDivision {}

extension Int8: AdvancedDivision {}

extension Int32: AdvancedDivision {}

extension Int64: AdvancedDivision {}

extension UInt: AdvancedDivision {}

extension UInt8: AdvancedDivision {}

extension UInt32: AdvancedDivision {}

extension UInt64: AdvancedDivision {}
