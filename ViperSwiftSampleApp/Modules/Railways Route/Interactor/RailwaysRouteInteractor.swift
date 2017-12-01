//
//  RailwaysRouteInteractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation

class RailwaysRouteInteractor: RailwaysRouteUseCase {

    var output: RailwaysRouteInteractorOutput!

    func fetchRailwaysRoute(_ trainNumber: String) {
        
        //Fetch Railways Route for trainNumber
        RailwaysRouteApiService.fetchRailwaysRoute(trainNumber) { (railwaysRouteModel, isError, errorString) in
            
            //Check for Error
            if !isError {
                
                //No Error
                if let railwaysRouteModelObj = railwaysRouteModel {
                    
                    //Route fetched successfully
                    self.output.railwaysRouteFetchedSuccessfully(railwaysRouteModelObj)
                } else {
                    
                    //No Route Received or data could not be parsed
                   self.output.railwaysRouteFetchFailed()
                }
            } else {
                
                //Error
                self.output.railwaysRouteFetchFailed()
            }
            
        }
    }
}
