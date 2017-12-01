//
//  ItunesMusicModel.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 01/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import ObjectMapper

struct ItunesMusicResultModel: Mappable {
    
    var resultCount: Int?
    var results: [ItunesMusicModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        results       <- map["results"]
        resultCount       <- map["resultCount"]
    }
}

struct ItunesMusicModel: Mappable {
    
    var artistId: Int?
    var artistName: String?
    var artistViewUrl: String?
    var artworkUrl100: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var collectionArtistId: Int?
    var collectionArtistName: String?
    var collectionArtistViewUrl: String?
    var collectionCensoredName: String?
    var collectionExplicitness: String?
    var collectionId: Int?
    var collectionName: String?
    var collectionPrice: Int?
    var collectionViewUrl: String?
    var country: String?
    var currency: String?
    var discCount: Int?
    var discNumber: Int?
    var isStreamable: Bool?
    var kind: String?
    var previewUrl: String?
    var primaryGenreName: String?
    var releaseDate: String?
    var trackCensoredName: String?
    var trackCount: Int?
    var trackExplicitness: String?
    var trackId: Int?
    var trackName: String?
    var trackNumber: Int?
    var trackPrice: Int?
    var trackTimeMillis: Int?
    var trackViewUrl: String?
    var wrapperType: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
     
        artistId       <- map["artistId"]
        artistName       <- map["artistName"]
        artistViewUrl       <- map["artistViewUrl"]
        artworkUrl100       <- map["artworkUrl100"]
        artworkUrl30       <- map["artworkUrl30"]
        artworkUrl60       <- map["artworkUrl60"]
        collectionArtistId       <- map["collectionArtistId"]
        collectionArtistName       <- map["collectionArtistName"]
        collectionArtistViewUrl       <- map["collectionArtistViewUrl"]
        collectionCensoredName       <- map["collectionCensoredName"]
        collectionExplicitness       <- map["collectionExplicitness"]
        collectionId       <- map["collectionId"]
        collectionName       <- map["collectionName"]
        collectionPrice       <- map["collectionPrice"]
        collectionViewUrl       <- map["collectionViewUrl"]
        country       <- map["country"]
        currency       <- map["currency"]
        discCount       <- map["discCount"]
        discNumber       <- map["discNumber"]
        isStreamable       <- map["isStreamable"]
        kind       <- map["kind"]
        previewUrl       <- map["previewUrl"]
        primaryGenreName       <- map["primaryGenreName"]
        releaseDate       <- map["releaseDate"]
        trackCensoredName       <- map["trackCensoredName"]
        trackCount       <- map["trackCount"]
        trackExplicitness       <- map["trackExplicitness"]
        trackId       <- map["trackId"]
        trackName       <- map["trackName"]
        trackNumber       <- map["trackNumber"]
        trackPrice       <- map["trackPrice"]
        trackTimeMillis       <- map["trackTimeMillis"]
        trackViewUrl       <- map["trackViewUrl"]
        wrapperType       <- map["wrapperType"]
    }
}
