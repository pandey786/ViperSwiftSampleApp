//
//  RailwaysRunningStatusApiService.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 01/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class RailwaysRunningStatusApiService {
    
    static func fetchRailwaysRunningStatus(_ trainNumber: String, _ startDate: String, completionHandler: @escaping (_ railwaysRunningStatus: RailwaysRunningStatusModel?, _ isError: Bool, _ error: String?) -> ()) {
        
        let railwaysRunningStatusUrl = Endpoints.RailwaysRunningStatus.fetch.url + trainNumber + "/date/" + startDate + API.railwaysAPIKeyPath
        
        Alamofire.request(railwaysRunningStatusUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "Could not get proper response")
            })
            .responseObject { (response: DataResponse<RailwaysRunningStatusModel>) in
                
                switch response.result {
                case .success(let railwaysRunningStatus):
                    
                    //Response received successfully
                    completionHandler(railwaysRunningStatus, false, nil)
                    break
                case .failure(let error):
                    
                    //There was an error
                    completionHandler(nil, true, error.localizedDescription)
                    break
                }
        }
    }
}
