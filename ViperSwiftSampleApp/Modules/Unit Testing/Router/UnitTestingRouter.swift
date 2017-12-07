//
//  UnitTestingRouter.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 07/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

class UnitTestingRouter: UnitTestingWireframe {
   
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let view: UnitTestingViewController = unitTestingStoryBoard.instantiateViewController(withIdentifier: "UnitTestingViewController") as! UnitTestingViewController
        
        let presenter = UnitTestingPresenter()
        let interactor = UnitTestingInteractor()
        let router = UnitTestingRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
