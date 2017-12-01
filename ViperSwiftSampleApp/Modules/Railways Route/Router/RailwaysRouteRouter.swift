//
//  RailwaysRouteRouter.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

class RailwaysRouteRouter: RailwaysRouteWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let view: RailwaysRouteViewController = railwaysRouteBoard.instantiateViewController(withIdentifier: "RailwaysRouteViewController") as! RailwaysRouteViewController
        
        let presenter = RailwaysRoutePresenter()
        let interactor = RailwaysRouteInteractor()
        let router = RailwaysRouteRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return view
    }
}
