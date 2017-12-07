//
//  UnitTestingPresenter.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 07/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation

class UnitTestingPresenter: UnitTestingPresentation {
    
    var view: UnitTestingView?
    var interactor: UnitTestingUsecase!
    var router: UnitTestingWireframe!
    
    var unitTestModel: [UnitTestModel]?
    
    func fetchUnitTestData() {
        
        view?.showActivityIndicator()
        interactor.fetchUnitTestData()
    }
    
}

extension UnitTestingPresenter: UnitTestingInteractorOutput {
    
    func unitTestDataFetchedSuccessfully(_ unitTestData: [UnitTestModel]) {
        
        view?.hideActivityIndicator()
        self.unitTestModel = unitTestData
        
        if let unitTestObj = self.unitTestModel {
            view?.showUnitTestData(unitTestObj)
        }
    }
    
    func unitTestDataFetchFailed() {
        view?.hideActivityIndicator()
        view?.showNoContentScreen()
    }
}
