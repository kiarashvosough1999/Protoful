//
//  AdvancedMultiplicableTests.swift
//  ProtofulTests
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
import XCTest
@testable import Protoful

final class AdvancedMultiplicableTests: XCTestCase {
    
    // MARK: - Int
    
    func testMultiplyInt() throws {
        let number: Int = 20
        
        XCTAssertEqual(number.multiply(10), 200)
    }
    
    func testSquareInt() throws {
        let number: Int = 20
        
        XCTAssertEqual(number.square(), 400)
    }
    
    // MARK: - Double
    
    func testMultiplyDouble() throws {
        let number: Double = 20.1000
        
        XCTAssertEqual(String(format: "%.4f", number.multiply(10)), "201.0000")
    }
    
    func testSquareDouble() throws {
        let number: Double = 20.12
        
        XCTAssertEqual(String(format: "%.4f", number.square()), "404.8144")
    }
    
    // MARK: - Float
    
    func testMultiplyFloat() throws {
        let number: Float = 20.1000
        
        XCTAssertEqual(String(format: "%.4f", number.multiply(10)), "201.0000")
    }
    
    func testSquareFloat() throws {
        let number: Float = 20.12
        
        XCTAssertEqual(String(format: "%.4f", number.square()), "404.8144")
    }

}
