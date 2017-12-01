//
//  HomeContractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

protocol HomeView: IndicatableView {
    
    var presenter: HomePresentation!{ get set }
    
    func showNoContentScreen()
    func showHomeData(_ homeItems: [HomeItem])
}

protocol HomePresentation: class {
    
    weak var view: HomeView? { get set }
    var interactor: HomeUseCase! { get set }
    var router: HomeWireframe! { get set }
    
    func viewDidLoad()
    func didSelectHomeItem(_ homeItem: HomeItem)
}

protocol HomeUseCase: class {
    
    var output: HomeInteractorOutput! { get set }
    
    func fetchHomeData()
}

protocol HomeInteractorOutput: class {
    
    func homeDataFetchedSuccessfully(_ homeItems: [HomeItem])
    func homeDataFetchFailed()
}

protocol HomeWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    
    func presentNextController(for homeItem: HomeItem)
    
    static func assembleModule() -> UIViewController
}
