//
//  RailwaysRouteInteractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation

class RailwaysRunningStatusInteractor: RailwaysRunningStatusUseCase {

    var output: RailwaysRunningStatusInteractorOutput!

    func fetchRailwaysRunningStatus(_ trainNumber: String, _ startDate: String) {
        
        //Fetch Railways Running Status for trainNumber
        RailwaysRunningStatusApiService.fetchRailwaysRunningStatus(trainNumber, startDate) { (railwaysRunningStatusModel, isError, errorString) in
            
            //Check for Error
            if !isError {
                
                //No Error
                if let railwaysRunningStatusModelObj = railwaysRunningStatusModel {
                    
                    //Running Status fetched successfully
                    self.output.railwaysRunningStatusFetchedSuccessfully(railwaysRunningStatusModelObj)
                } else {
                    
                    //No Running Status Received or data could not be parsed
                   self.output.railwaysRunningStatusFetchFailed()
                }
            } else {
                
                //Error
                self.output.railwaysRunningStatusFetchFailed()
            }
            
        }
    }
}
