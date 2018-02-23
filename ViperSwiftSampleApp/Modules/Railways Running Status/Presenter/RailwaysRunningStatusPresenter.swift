//
//  RailwaysRunningStatusPresenter.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation

class RailwaysRunningStatusPresenter: RailwaysRunningStatusPresentation {
    
    var view: RailwaysRunningStatusView?
    var interactor: RailwaysRunningStatusUseCase!
    var router: RailwaysRunningStatusWireframe!
    
    var railwaysRunningStatus: RailwaysRunningStatusModel?
    
    func viewDidLoad() {
        
    }
    
    func fetchRailwaysRunningStatus(_ trainNumber: String, _ startDate: String) {
        
        interactor.fetchRailwaysRunningStatus(trainNumber, startDate)
        view?.showActivityIndicator()
    }
}

extension RailwaysRunningStatusPresenter: RailwaysRunningStatusInteractorOutput {
    
    func railwaysRunningStatusFetchedSuccessfully(_ railwaysRunningStatus: RailwaysRunningStatusModel) {
        self.railwaysRunningStatus = railwaysRunningStatus
        view?.hideActivityIndicator()
        
        if let railwaysRunningStatusModel = self.railwaysRunningStatus {
            view?.showRailwaysRunningStatusData(railwaysRunningStatusModel)
        }
    }
    
    func railwaysRunningStatusFetchFailed() {
        view?.hideActivityIndicator()
        view?.showNoContentScreen()
    }
}
