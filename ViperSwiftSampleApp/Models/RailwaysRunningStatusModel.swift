//
//  RailwaysRunningStatusModel.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 01/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import ObjectMapper

struct RailwaysRunningStatusModel: Mappable {
    
    var route: [TrainRunningStatusRouteModel]?
    var train: RunningStatusTrainModel?
    var current_station: RunningStatusCurrentStationModel?
    var start_date: String?
    var response_code: String?
    var position: String?
    var debit: String?
    
    init?(map: Map) {
        
        route    <- map["route"]
        train    <- map["train"]
        current_station    <- map["current_station"]
        start_date    <- map["start_date"]
        response_code    <- map["response_code"]
        position    <- map["position"]
        debit    <- map["debit"]
    }
    
    mutating func mapping(map: Map) {
        
    }
}

struct RunningStatusCurrentStationModel: Mappable {
    
    var lat: String?
    var lng: String?
    var name: String?
    var code: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        lat       <- map["lat"]
        lng     <- map["lng"]
        name       <- map["name"]
        code     <- map["code"]
    }
}

struct RunningStatusTrainModel: Mappable {
    
    var number: String?
    var name: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        number       <- map["number"]
        name     <- map["name"]
    }
}

struct TrainRunningStatusRouteModel: Mappable {
    
    var has_arrived: Bool?
    var actdep: String?
    var actarr: String?
    var latemin: Int?
    var scharr_date: String?
    var actarr_date: String?
    var has_departed: Bool?
    var status: String?
    var day: Int?
    var distance: Int?
    var schdep: String?
    var halt: Int?
    var no: Int?
    var scharr: String?
    var station: TrainRunningStatusRouteStationModel?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        has_arrived      <- map["has_arrived"]
        actdep      <- map["actdep"]
        actarr      <- map["actarr"]
        latemin      <- map["latemin"]
        scharr_date      <- map["scharr_date"]
        actarr_date      <- map["actarr_date"]
        has_departed      <- map["has_departed"]
        status      <- map["status"]
        day       <- map["day"]
        distance     <- map["distance"]
        schdep       <- map["schdep"]
        halt     <- map["halt"]
        no       <- map["no"]
        scharr     <- map["scharr"]
        station       <- map["station"]
    }
}

struct TrainRunningStatusRouteStationModel: Mappable {
    
    var name: String?
    var code: String?
    var lat: Double?
    var lng: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name       <- map["name"]
        code     <- map["code"]
        lat       <- map["lat"]
        lng     <- map["lng"]
    }
}
