//
//  RailwaysRouteRouter.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

class RailwaysRunningStatusRouter: RailwaysRunningStatusWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let view: RailwaysRunningStatusViewController = railwaysRunningStatusStoryBoard.instantiateViewController(withIdentifier: "RailwaysRunningStatusViewController") as! RailwaysRunningStatusViewController
        
        let presenter = RailwaysRunningStatusPresenter()
        let interactor = RailwaysRunningStatusInteractor()
        let router = RailwaysRunningStatusRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return view
    }
}
