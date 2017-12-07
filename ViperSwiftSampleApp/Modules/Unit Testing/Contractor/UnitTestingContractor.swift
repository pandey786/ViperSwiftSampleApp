//
//  UnitTestingContractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 07/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

protocol UnitTestingView: IndicatableView {
    
    var presenter: UnitTestingPresentation! { get set }
    
    func showUnitTestData(_ unitTestData: [UnitTestModel])
    func showNoContentScreen()
}

protocol UnitTestingPresentation: class {
    
    weak var view: UnitTestingView? { get set }
    var interactor: UnitTestingUsecase! { get set }
    var router: UnitTestingWireframe! { get set }
    
   func fetchUnitTestData()
}

protocol UnitTestingUsecase: class {
    
    var output: UnitTestingInteractorOutput! { get set }
    
    func fetchUnitTestData()
}

protocol UnitTestingInteractorOutput: class {
    
    func unitTestDataFetchedSuccessfully(_ unitTestData: [UnitTestModel])
    func unitTestDataFetchFailed()
}

protocol UnitTestingWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
}
