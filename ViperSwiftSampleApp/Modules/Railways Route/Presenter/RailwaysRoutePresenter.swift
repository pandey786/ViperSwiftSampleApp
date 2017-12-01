//
//  RailwaysRoutePresenter.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation

class RailwaysRoutePresenter: RailwaysRoutePresentation {
    
    var view: RailwaysRouteView?
    var interactor: RailwaysRouteUseCase!
    var router: RailwaysRouteWireframe!
    
    var railwaysRoute: RailwaysRouteModel?
    
    func viewDidLoad() {
        
    }
    
    func fetchRailwaysRoute(_ trainNumber: String) {
        
        interactor.fetchRailwaysRoute(trainNumber)
        view?.showActivityIndicator()
    }
}

extension RailwaysRoutePresenter: RailwaysRouteInteractorOutput {
    
    func railwaysRouteFetchedSuccessfully(_ railwaysRoute: RailwaysRouteModel) {
        self.railwaysRoute = railwaysRoute
        view?.hideActivityIndicator()
        
        if let railwaysRouteModel = self.railwaysRoute {
            view?.showRailwaysRouteDate(railwaysRouteModel)
        }
    }
    
    func railwaysRouteFetchFailed() {
        view?.hideActivityIndicator()
        view?.showNoContentScreen()
    }
}
