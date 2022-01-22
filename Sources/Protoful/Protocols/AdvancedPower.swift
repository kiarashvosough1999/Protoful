//
//  AdvancedPower.swift
//  Protful
//
//  Created by Kiarash Vosough on 1/22/22.
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

public protocol AdvancedPower {
    
    var square: Double { get }
    
    func power(_ any: Self) -> Double
    
    func root(_ any: Self) -> Double
}

public extension AdvancedPower where Self: BinaryFloatingPoint {
    
    var square: Double {
        pow(Double(self), Double(self))
    }
    
    func power(_ any: Self) -> Double {
        pow(Double(self), Double(any))
    }
    
    func root(_ any: Self) -> Double {
        pow(Double(self), Double(1/any))
    }
}

public extension AdvancedPower where Self: BinaryInteger {
    
    var square: Double {
        pow(Double(self), Double(self))
    }
    
    func power(_ any: Self) -> Double {
        pow(Double(self), Double(any))
    }
    
    func root(_ any: Self) -> Double {
        pow(Double(self), Double(1/any))
    }
}

// MARK: - Primitive types

extension Double: AdvancedPower {}

extension Float: AdvancedPower {}

@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension Float16: AdvancedPower {}

extension CGFloat: AdvancedPower {}

extension Int: AdvancedPower {}

extension Int8: AdvancedPower {}

extension Int32: AdvancedPower {}

extension Int64: AdvancedPower {}

extension UInt: AdvancedPower {}

extension UInt8: AdvancedPower {}

extension UInt32: AdvancedPower {}

extension UInt64: AdvancedPower {}
