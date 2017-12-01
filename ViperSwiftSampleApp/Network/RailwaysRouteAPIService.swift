//
//  RailwaysRouteAPIService.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class RailwaysRouteApiService {
    
    static func fetchRailwaysRoute(_ trainNumber: String, completionHandler: @escaping (_ railwaysRoute: RailwaysRouteModel?, _ isError: Bool, _ error: String?) -> ()) {
        
        let railwaysRouteUrl = Endpoints.RailwaysRoute.fetch.url + trainNumber + API.railwaysAPIKeyPath
        Alamofire.request(railwaysRouteUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "Could not get proper response")
            })
            .responseObject { (response: DataResponse<RailwaysRouteModel>) in
                
                switch response.result {
                case .success(let railwaysRoute):
                    
                    //Response received successfully
                    completionHandler(railwaysRoute, false, nil)
                    break
                case .failure(let error):
                    
                    //There was an error
                    completionHandler(nil, true, error.localizedDescription)
                    break
                }
        }
    }
}
