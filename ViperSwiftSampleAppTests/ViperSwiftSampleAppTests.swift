//
//  ViperSwiftSampleAppTests.swift
//  ViperSwiftSampleAppTests
//
//  Created by Durgesh Pandey on 29/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import XCTest
@testable import ViperSwiftSampleApp

class ViperSwiftSampleAppTests: XCTestCase {
    
    var unitTestingInteractor: UnitTestingInteractor!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        unitTestingInteractor = UnitTestingInteractor()
    }
    
    override func tearDown() {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        unitTestingInteractor = nil
        
        super.tearDown()
    }
    
    func testDifferenceComputed() {
        
        //given
        let firstVal = 100
        let secondVal = 50
        
        //when
        let difference = unitTestingInteractor.getDifference(firstVal, secondVal)
        
        //then
        XCTAssertEqual(50, difference, "Correct difference was not calculated")
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
