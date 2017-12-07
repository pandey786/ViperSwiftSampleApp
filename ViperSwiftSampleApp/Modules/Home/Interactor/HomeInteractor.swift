//
//  HomeInteractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation

class HomeInteractor: HomeUseCase {
    var output: HomeInteractorOutput!
    
    func fetchHomeData() {
        
        //Create home Data Items and send to Output Interactor
        let homeItem1 = HomeItem.init(homeItemId: "1", homeItemName: "Train Route")
        let homeItem2 = HomeItem.init(homeItemId: "2", homeItemName: "ITunes Music")
        let homeItem3 = HomeItem.init(homeItemId: "3", homeItemName: "Train Running Status")
        let homeItem4 = HomeItem.init(homeItemId: "4", homeItemName: "Machine Learning")
        let homeItem5 = HomeItem.init(homeItemId: "5", homeItemName: "Unit Testing")
        
        let homeItems = [homeItem1, homeItem2, homeItem3, homeItem4, homeItem5]
        
        //Pass this data to Interactor
        self.output.homeDataFetchedSuccessfully(homeItems)
        
    }
}
