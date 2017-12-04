//
//  HomeRouter.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomeWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let view: HomeViewController = homeStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        let navigationController = UINavigationController.init(rootViewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigationController
        
    }
    
    
    func presentNextController(for homeItem: HomeItem) {
        
        switch homeItem.homeItemId {
        case "1":
            let railwaysRouteCtrl = RailwaysRouteRouter.assembleModule()
            viewController?.navigationController?.pushViewController(railwaysRouteCtrl, animated: true)
        case "2":
            let itunesMusicCtrl = ItunesMusicRouter.assembleModule()
            viewController?.navigationController?.pushViewController(itunesMusicCtrl, animated: true)
        case "3":
            let runningStatusCtrl = RailwaysRunningStatusRouter.assembleModule()
            viewController?.navigationController?.pushViewController(runningStatusCtrl, animated: true)
        default:
            break
        }
    }
}
