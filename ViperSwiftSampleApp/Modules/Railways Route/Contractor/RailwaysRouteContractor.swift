//
//  RialwaysRouteContractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

protocol RailwaysRouteView: IndicatableView {
    
    var presenter: RailwaysRoutePresentation! { get set }
    
    func showNoContentScreen()
    func showRailwaysRouteDate(_ railwaysRoute: RailwaysRouteModel)
    func clearLastSearchedData()
}

protocol RailwaysRoutePresentation: class {
    
    weak var view: RailwaysRouteView? { get set }
    var interactor: RailwaysRouteUseCase! { get set }
    var router: RailwaysRouteWireframe! { get set }
    
    func viewDidLoad()
    func fetchRailwaysRoute(_ trainNumber: String)
}

protocol RailwaysRouteUseCase: class {
    
    var output: RailwaysRouteInteractorOutput! { get set }
    
    func fetchRailwaysRoute(_ trainNumber: String)
}

protocol RailwaysRouteInteractorOutput: class {
    
    func railwaysRouteFetchedSuccessfully(_ railwaysRoute: RailwaysRouteModel)
    func railwaysRouteFetchFailed()
}

protocol RailwaysRouteWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
}
