//
//  CastableTests.swift
//  ProtofulTests
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

import XCTest

final class CastableTests: XCTestCase {

    
    func testDownCast() throws {
        
        let mock: parentTestCastableMock = childTestCastableMock()
        
        let down = mock.cast(to: childTestCastableMock.self)

        XCTAssertNotNil(down)
    }
    
    func testForceCast() throws {
        
        let mock: parentTestCastableMock = childTestCastableMock()
        
        let down: childTestCastableMock? = mock.forceCast(to: childTestCastableMock.self)

        XCTAssertNotNil(down)
    }
    
    func testUnsafeBitCastWithEqualBit() throws {
        
        let mock: parentTestCastableMock = childTestCastableMock()
        
        let down: childTestCastableMock? = try mock.unsafeBitCast(to: childTestCastableMock.self)

        XCTAssertNotNil(down)
    }
    
    func testUnsafeDownCast() throws {
        
        let mock: parentTestCastableMock = childTestCastableMock()
        
        let down: childTestCastableMock? = try mock.unsafeDownCast(to: childTestCastableMock.self)

        XCTAssertNotNil(down)
    }
    
    func testUnsafeDownCastNonRefrenceType() throws {
        
        let mock = TestCastableMockNonRefrence()

        XCTAssertThrowsError(try mock.unsafeDownCast(to: childTestCastableMock.self))
    }
    
    func testRefrenceType() throws {
        
        let mock = childTestCastableMock()
        

        XCTAssertTrue(mock.isReferenceType())
    }
    
    func testNonRefrenceType() throws {
        
        let mock = TestCastableMockNonRefrence()

        XCTAssertFalse(mock.isReferenceType())
    }
    
    func testUnsafeBitCastWithNonEqualBit() throws {
        
        let mock = childTestCastableMock()
        
        XCTAssertThrowsError(try mock.unsafeBitCast(to: Any.self))
    }
}
