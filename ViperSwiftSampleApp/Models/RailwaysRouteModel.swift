//
//  RailwaysRouteModel.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import ObjectMapper

struct RailwaysRouteModel: Mappable {
    
     var route: [TrainRouteModel]?
    var train: TrainModel?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        route       <- map["route"]
        train     <- map["train"]
    }
}

struct TrainModel: Mappable {
    
    var number: String?
    var name: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        number       <- map["number"]
        name     <- map["name"]
    }
}

struct TrainRouteModel: Mappable {
   
    var day: String?
    var distance: String?
    var schdep: String?
    var halt: String?
    var no: String?
    var scharr: String?
    var station: TrainRouteStationModel?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        day       <- map["day"]
        distance     <- map["distance"]
        schdep       <- map["schdep"]
        halt     <- map["halt"]
        no       <- map["no"]
        scharr     <- map["scharr"]
        station       <- map["station"]
    }
}

struct TrainRouteStationModel: Mappable {
    
    var name: String?
    var code: String?
    var lat: String?
    var lng: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name       <- map["name"]
        code     <- map["code"]
        lat       <- map["lat"]
        lng     <- map["lng"]
    }
}
