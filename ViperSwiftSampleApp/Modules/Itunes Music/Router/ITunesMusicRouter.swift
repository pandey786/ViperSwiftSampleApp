//
//  ITunesMusicRouter.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 01/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

class ItunesMusicRouter: ItunesMusciWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
     
        let view: ITunesMusicViewController = iTunesMusicStoryBoard.instantiateViewController(withIdentifier: "ITunesMusicViewController") as! ITunesMusicViewController
        
        let presenter = ItunesMusicPresenter()
        let interactor = ItunesMusicInteractor()
        let router = ItunesMusicRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
