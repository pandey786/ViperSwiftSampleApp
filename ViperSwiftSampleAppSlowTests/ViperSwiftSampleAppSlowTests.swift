//
//  ViperSwiftSampleAppSlowTests.swift
//  ViperSwiftSampleAppSlowTests
//
//  Created by Durgesh Pandey on 04/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import XCTest
import Alamofire
@testable import ViperSwiftSampleApp

class ViperSwiftSampleAppSlowTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRailwaysRunningStatusAPIResponse() {
        
        //given
        let railwaysRunningStatusUrl = Endpoints.RailwaysRunningStatus.fetch.url + "12149" + "/date/" + "01-12-2017" + API.railwaysAPIKeyPath
        
        let promise = expectation(description: "Success")
        var resultStatus: String?
        var responseError: Error?
        
        // when
        Alamofire.request(railwaysRunningStatusUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "Could not get proper response")
            })
            .responseObject { (response: DataResponse<RailwaysRunningStatusModel>) in
                
                // then
                switch response.result {
                case .success(let railwaysRunningStatus):
                    
                    resultStatus = "Success"
                    
                    print(railwaysRunningStatus)
                    promise.fulfill()
                    
                    //Response received successfully
                    
                    break
                case .failure(let error):
                    
                    responseError = error
                    
                    //There was an error
                    XCTFail(error.localizedDescription)
                    break
                }
        }
        
        /*
         waitForExpectations(_:handler:) keeps the test running until all expectations are fulfilled, or the timeout interval ends, whichever happens first
         */
        waitForExpectations(timeout: 10, handler: nil)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(resultStatus, "Success")
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
