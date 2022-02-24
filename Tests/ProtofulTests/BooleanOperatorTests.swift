//
//  BooleanOperatorTests.swift
//  
//
//  Created by Kiarash Vosough on 2/24/22.
//

import XCTest
@testable import Protoful

class BooleanOperatorTests: XCTestCase {

    func testAndFalse() {
        
        let firstExp = true
        let secondExp = false
        
        XCTAssertFalse(firstExp.and(secondExp))
        
        let firstExp2 = false
        let secondExp2 = true
        
        XCTAssertFalse(firstExp2.and(secondExp2))
        
        
        let firstExp3 = false
        let secondExp3 = false
        
        XCTAssertFalse(firstExp3.and(secondExp3))
    }
    
    func testAndTrue() {
        
        let firstExp = true
        let secondExp = true
        
        XCTAssertTrue(firstExp.and(secondExp))
    }
    
    func testOrTrue() {
        
        let firstExp = true
        let secondExp = false
        
        XCTAssertTrue(firstExp.or(secondExp))
        
        let firstExp2 = false
        let secondExp2 = true
        
        XCTAssertTrue(firstExp2.or(secondExp2))
        
        
        let firstExp3 = true
        let secondExp3 = true
        
        XCTAssertTrue(firstExp3.or(secondExp3))
    }
    
    func testOrFalse() {
        
        let firstExp = false
        let secondExp = false
        
        XCTAssertFalse(firstExp.or(secondExp))
    }
    
    func testNandTrue() {
        
        let firstExp = true
        let secondExp = false
        
        XCTAssertTrue(firstExp.nand(secondExp))
        
        let firstExp2 = false
        let secondExp2 = true
        
        XCTAssertTrue(firstExp2.nand(secondExp2))
        
        
        let firstExp3 = false
        let secondExp3 = false
        
        XCTAssertTrue(firstExp3.nand(secondExp3))
    }
    
    func testNandFalse() {
        
        let firstExp = true
        let secondExp = true
        
        XCTAssertFalse(firstExp.nand(secondExp))
    }
    
    func testNorFalse() {
        
        let firstExp = true
        let secondExp = false
        
        XCTAssertFalse(firstExp.nor(secondExp))
        
        let firstExp2 = false
        let secondExp2 = true
        
        XCTAssertFalse(firstExp2.nor(secondExp2))
        
        
        let firstExp3 = true
        let secondExp3 = true
        
        XCTAssertFalse(firstExp3.nor(secondExp3))
    }
    
    func testNorTrue() {
        
        let firstExp = false
        let secondExp = false
        
        XCTAssertTrue(firstExp.nor(secondExp))
    }

    func testPerformanceExample() throws {
        let firstExp = false
        let secondExp = false
        
        measure(metrics: [XCTClockMetric(),XCTCPUMetric(),XCTMemoryMetric()], options: .default) {
            _ = firstExp.nor(secondExp)
            _ = !(firstExp || secondExp)
        }
    }

}
