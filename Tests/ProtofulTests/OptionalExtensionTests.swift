//
//  OptionalExtensionTests.swift
//  
//
//  Created by Kiarash Vosough on 1/17/22.
//

import XCTest
import Protoful

class OptionalExtensionTests: XCTestCase {
    
    func testIsNil() throws {
        var myTestNumber: Int?
        let myTestNumber2: Int? = 1
        
        XCTAssertTrue(myTestNumber.isNil)
        XCTAssertFalse(myTestNumber2.isNil)
    }
    
    func testIsNotNil() throws {
        var myTestNumber: Int?
        let myTestNumber2: Int? = 1
        
        XCTAssertTrue(myTestNumber2.isNotNil)
        XCTAssertFalse(myTestNumber.isNotNil)
    }
    
    func testMatching() throws {
        
        var myNilTest: Int?
        
        let resNil = myNilTest.matching { number in
            return number > 5
        }
        
        XCTAssertNil(resNil)
        
        //
        
        let myTest: Int? = 10
        
        let matching2Expectaion = XCTestExpectation()
        matching2Expectaion.expectedFulfillmentCount = 1
        
        let res = myTest.matching { number in
            matching2Expectaion.fulfill()
            return number > 5
        }
        
        wait(for: [matching2Expectaion], timeout: 1)
        XCTAssertNotNil(res)
        
        //
        
        let myTestOutOfRange: Int? = 2
        
        let matching3Expectaion = XCTestExpectation()
        matching3Expectaion.expectedFulfillmentCount = 1
        
        let resOutOfRange = myTestOutOfRange.matching { number in
            matching3Expectaion.fulfill()
            return number > 5
        }
        
        wait(for: [matching3Expectaion], timeout: 1)
        XCTAssertNil(resOutOfRange)
        
    }
    
    func testOnValue() throws {
        
        let nilTest: Int? = 80
        
        let matching1Expectaion = XCTestExpectation()
        matching1Expectaion.expectedFulfillmentCount = 1
        
        nilTest.onValue { value in
            matching1Expectaion.fulfill()
        }
        
        wait(for: [matching1Expectaion], timeout: 1)
    }
    
    func testCompactMap() throws {
        
        let notNilTest: Int? = 80
        
        let matching1Expectaion = XCTestExpectation()
        matching1Expectaion.expectedFulfillmentCount = 1
        
        let double: Double? = notNilTest.map { value in
            matching1Expectaion.fulfill()
            return Double(value)
        }
        
        wait(for: [matching1Expectaion], timeout: 1)
        XCTAssertNotNil(double)
        
        
        var NilTest: Int?
        
        let doubleNil: Double? = NilTest.map { value in
            return Double(value)
        }
        
        XCTAssertNil(doubleNil)
        
    }
    
    func testOnValueWithNone() throws {
        
        let notNilTest: Int? = 80
        
        let hasValueExpectaion = XCTestExpectation()
        hasValueExpectaion.expectedFulfillmentCount = 1
        
        notNilTest.onValue { value in
            hasValueExpectaion.fulfill()
        } none: { }
        
        wait(for: [hasValueExpectaion], timeout: 1)

        //
        
        var nilTest: Int?
        
        let hasNotExpectaion = XCTestExpectation()
        hasNotExpectaion.expectedFulfillmentCount = 1
        
        nilTest.onValue { _ in } none: {
            hasNotExpectaion.fulfill()
        }
        
        wait(for: [hasNotExpectaion], timeout: 1)
        
    }
    
    func testFilterMap() throws {
        
        let notNilTest: Int? = 80
        
        let hasValueExpectaion = XCTestExpectation()
        hasValueExpectaion.expectedFulfillmentCount = 1
        
        let convertedValue = notNilTest.filterMap { value in
            hasValueExpectaion.fulfill()
            return Double(value)
        } none: {
            Double.infinity
        }
        
        wait(for: [hasValueExpectaion], timeout: 1)
        XCTAssertEqual(Double(80), convertedValue)
        //
        
        var nilTest: Int?
        
        let hasNotExpectaion = XCTestExpectation()
        hasNotExpectaion.expectedFulfillmentCount = 1
        
        let convertedValue2 = nilTest.filterMap { value in
            return Double(value)
        } none: {
            hasNotExpectaion.fulfill()
            return Double.infinity
        }
        
        XCTAssertEqual(Double.infinity, convertedValue2)
        wait(for: [hasNotExpectaion], timeout: 1)
        
    }
    
    func testOnAbsence() throws {
        
        var nilTest: Int?
        
        let matching1Expectaion = XCTestExpectation()
        matching1Expectaion.expectedFulfillmentCount = 1
        
        nilTest.onAbsence {
            matching1Expectaion.fulfill()
        }
        
        wait(for: [matching1Expectaion], timeout: 1)
    }
    
    func testOrDefault() throws {
        
        var nilValue: Int?
        
        let new = nilValue.or(10)
        
        XCTAssertEqual(new, 10)
        
        var nonNilValue: Int? = 80
        
        let old = nonNilValue.or(10)
        
        XCTAssertEqual(old, 80)
    }
    
    func testOrElseClosure() throws {
        
        var nilValue: Int?
        
        let matching1Expectaion = XCTestExpectation()
        matching1Expectaion.expectedFulfillmentCount = 1
        
        let new = nilValue.or {
            matching1Expectaion.fulfill()
            return 10
        }
        
        wait(for: [matching1Expectaion], timeout: 1)
        XCTAssertEqual(new, 10)
        
        var nonNilValue: Int? = 80
        
        let old = nonNilValue.or {
            return 10
        }
        
        XCTAssertEqual(old, 80)
    }
    
    func testOrElse() throws {
        
        var nilValue: Int?
        
        let new = nilValue.or(else: 10)
        
        XCTAssertEqual(new, 10)
        
        var nonNilValue: Int? = 80
        
        let old = nonNilValue.or(else: 10)
        
        XCTAssertEqual(old, 80)
    }
    
    func testOrThrow() throws {
        
        enum MyError: Error {
            case NilValue
        }
        
        var nilValue: Int?
        
        XCTAssertThrowsError(try nilValue.or(throw: MyError.NilValue))
        
        var nonNilValue: Int? = 80
        
        XCTAssertEqual(try nonNilValue.or(throw: MyError.NilValue), 80)
        XCTAssertNoThrow(try nonNilValue.or(throw: MyError.NilValue))
    }
    
    func testToggleNil() throws {
        
        var willNilValue: Int? = 10
        
        XCTAssertNotNil(willNilValue)
        XCTAssertEqual(willNilValue, 10)
        
        willNilValue.toggleNil()
        
        XCTAssertNil(willNilValue)
        
    }
}
