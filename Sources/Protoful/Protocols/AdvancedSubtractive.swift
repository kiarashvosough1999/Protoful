//
//  AdvancedSubtractive.swift
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

public protocol AdvancedSubtractive {
    func minus(_ any: Self) -> Self
}

public extension AdvancedSubtractive where Self: FloatingPoint {
    
    func minus(_ any: Self) -> Self {
        self - any
    }
}

public extension AdvancedSubtractive where Self: BinaryInteger {
    
    func minus(_ any: Self) -> Self {
        self - any
    }
}

// MARK: - Primitive types

extension Double: AdvancedSubtractive {}

extension Float: AdvancedSubtractive {}

@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension Float16: AdvancedSubtractive {}

extension CGFloat: AdvancedSubtractive {}

extension Int: AdvancedSubtractive {}

extension Int8: AdvancedSubtractive {}

extension Int32: AdvancedSubtractive {}

extension Int64: AdvancedSubtractive {}

extension UInt: AdvancedSubtractive {}

extension UInt8: AdvancedSubtractive {}

extension UInt32: AdvancedSubtractive {}

extension UInt64: AdvancedSubtractive {}
