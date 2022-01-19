//
//  AdvancedComparable.swift
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

public protocol AdvancedComparable: Comparable {
    
    func greaterThan(_ any: Self) -> Bool
    
    func greaterThanOrEqual(_ any: Self) -> Bool
    
    func lessThan(_ any: Self) -> Bool
    
    func lessThanOrEqual(_ any: Self) -> Bool
}

public extension AdvancedComparable {
    
    func greaterThan(_ any: Self) -> Bool { self > any }
    
    func greaterThanOrEqual(_ any: Self) -> Bool { self >= any }
    
    func lessThan(_ any: Self) -> Bool { self < any }
    
    func lessThanOrEqual(_ any: Self) -> Bool { self <= any }
    
}

// MARK: - Primitive types

extension Double: AdvancedComparable {}

extension Float: AdvancedComparable {}

@available(iOS 14.0, *)
@available(macOS 11.0, *)
extension Float16: AdvancedComparable {}

extension CGFloat: AdvancedComparable {}

extension Int: AdvancedComparable {}

extension Int8: AdvancedComparable {}

extension Int32: AdvancedComparable {}

extension Int64: AdvancedComparable {}

extension UInt: AdvancedComparable {}

extension UInt8: AdvancedComparable {}

extension UInt32: AdvancedComparable {}

extension UInt64: AdvancedComparable {}
