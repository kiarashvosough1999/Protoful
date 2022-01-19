//
//  AdvancedComparableTests.swift
//  ProtofulTests
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
import XCTest
@testable import Protoful

final class AdvancedComparableTests: XCTestCase {
    
    // MARK: - Int
    
    func testGreaterThanForInt() throws {
        let number: Int = 90
        
        XCTAssertTrue(number.greaterThan(80))
        XCTAssertFalse(number.greaterThan(100))
    }
    
    func testGreaterThanOrEqualForInt() throws {
        let number: Int = 90
        
        XCTAssertTrue(number.greaterThanOrEqual(90))
        XCTAssertTrue(number.greaterThanOrEqual(80))
        XCTAssertFalse(number.greaterThanOrEqual(100))
    }
    
    func testLessThanForInt() throws {
        let number: Int = 90
        
        XCTAssertTrue(number.lessThan(100))
        XCTAssertFalse(number.lessThan(80))
    }
    
    func testLessThanOrEqualForInt() throws {
        let number: Int = 90
        
        XCTAssertTrue(number.lessThanOrEqual(90))
        XCTAssertTrue(number.lessThanOrEqual(100))
        XCTAssertFalse(number.lessThanOrEqual(80))
    }
    
    // MARK: - UInt
    
    func testGreaterThanForUInt() throws {
        let number: UInt = 90
        
        XCTAssertTrue(number.greaterThan(80))
        XCTAssertFalse(number.greaterThan(100))
    }
    
    func testGreaterThanOrEqualForUInt() throws {
        let number: UInt = 90
        
        XCTAssertTrue(number.greaterThanOrEqual(90))
        XCTAssertTrue(number.greaterThanOrEqual(80))
        XCTAssertFalse(number.greaterThanOrEqual(100))
    }
    
    func testLessThanForUInt() throws {
        let number: UInt = 90
        
        XCTAssertTrue(number.lessThan(100))
        XCTAssertFalse(number.lessThan(80))
    }
    
    func testLessThanOrEqualForUInt() throws {
        let number: UInt = 90
        
        XCTAssertTrue(number.lessThanOrEqual(90))
        XCTAssertTrue(number.lessThanOrEqual(100))
        XCTAssertFalse(number.lessThanOrEqual(80))
    }
    
    // MARK: - Double
    
    func testGreaterThanForDouble() throws {
        let number: Double = 90.45
        
        XCTAssertTrue(number.greaterThan(80))
        XCTAssertFalse(number.greaterThan(100.67))
    }
    
    func testGreaterThanOrEqualForDouble() throws {
        let number: Double = 90.45
        
        XCTAssertTrue(number.greaterThanOrEqual(90.45))
        XCTAssertTrue(number.greaterThanOrEqual(80.91))
        XCTAssertFalse(number.greaterThanOrEqual(100.67))
    }
    
    func testLessThanForDouble() throws {
        let number: Double = 90.45
        
        XCTAssertTrue(number.lessThan(100.67))
        XCTAssertFalse(number.lessThan(80.91))
    }
    
    func testLessThanOrEqualForDouble() throws {
        let number: Double = 90.45
        
        XCTAssertTrue(number.lessThanOrEqual(90.45))
        XCTAssertTrue(number.lessThanOrEqual(100.67))
        XCTAssertFalse(number.lessThanOrEqual(80.91))
    }
    
    // MARK: - Float
    
    func testGreaterThanForFloat() throws {
        let number: Float = 90.45
        
        XCTAssertTrue(number.greaterThan(80))
        XCTAssertFalse(number.greaterThan(100.67))
    }
    
    func testGreaterThanOrEqualForFloat() throws {
        let number: Float = 90.45
        
        XCTAssertTrue(number.greaterThanOrEqual(90.45))
        XCTAssertTrue(number.greaterThanOrEqual(80.91))
        XCTAssertFalse(number.greaterThanOrEqual(100.67))
    }
    
    func testLessThanForFloat() throws {
        let number: Float = 90.45
        
        XCTAssertTrue(number.lessThan(100.67))
        XCTAssertFalse(number.lessThan(80.91))
    }
    
    func testLessThanOrEqualForFloat() throws {
        let number: Float = 90.45
        
        XCTAssertTrue(number.lessThanOrEqual(90.45))
        XCTAssertTrue(number.lessThanOrEqual(100.67))
        XCTAssertFalse(number.lessThanOrEqual(80.91))
    }
}
