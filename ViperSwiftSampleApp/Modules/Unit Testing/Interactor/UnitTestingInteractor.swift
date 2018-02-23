//
//  UnitTestingInteractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 07/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation

class UnitTestingInteractor: UnitTestingUsecase {
    
    var output: UnitTestingInteractorOutput!
    
    func fetchUnitTestData() {
        
        //Fetch Unit test Data and assign to output
        
        var unitTestModelArr = [UnitTestModel]()
        for i in 1...5 {
            var unitTestModel = UnitTestModel()
            
            unitTestModel.unitTestId = "\(i)"
            unitTestModel.unitTestName = "Unit Test \(i)"
            unitTestModelArr.append(unitTestModel)
        }
        
        if unitTestModelArr.count > 0 {
            
            self.output.unitTestDataFetchedSuccessfully(unitTestModelArr)
        } else {
            self.output.unitTestDataFetchFailed()
        }
        
    }
    
    func getDifference(_ firstValue: Int, _ secondValue: Int) -> Int {
        
        //First test Case this should fail
        return (firstValue - secondValue)
        
        //This should pass
        //return abs((firstValue - secondValue))
    }
}
