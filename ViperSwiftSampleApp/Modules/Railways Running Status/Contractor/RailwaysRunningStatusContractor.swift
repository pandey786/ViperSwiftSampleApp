//
//  RialwaysRouteContractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

protocol RailwaysRunningStatusView: IndicatableView {
    
    var presenter: RailwaysRunningStatusPresentation! { get set }
    
    func showNoContentScreen()
    func showRailwaysRunningStatusData(_ railwaysRunningStatus: RailwaysRunningStatusModel)
    func clearLastSearchedData()
}

protocol RailwaysRunningStatusPresentation: class {
    
    weak var view: RailwaysRunningStatusView? { get set }
    var interactor: RailwaysRunningStatusUseCase! { get set }
    var router: RailwaysRunningStatusWireframe! { get set }
    
    func viewDidLoad()
    func fetchRailwaysRunningStatus(_ trainNumber: String, _ startDate: String)
}

protocol RailwaysRunningStatusUseCase: class {
    
    var output: RailwaysRunningStatusInteractorOutput! { get set }
    
    func fetchRailwaysRunningStatus(_ trainNumber: String, _ startDate: String)
}

protocol RailwaysRunningStatusInteractorOutput: class {
    
    func railwaysRunningStatusFetchedSuccessfully(_ railwaysRunningStatus: RailwaysRunningStatusModel)
    func railwaysRunningStatusFetchFailed()
}

protocol RailwaysRunningStatusWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
}
