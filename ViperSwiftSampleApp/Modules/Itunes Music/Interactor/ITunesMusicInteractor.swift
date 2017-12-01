//
//  ITunesMusicInteractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 01/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation

class ItunesMusicInteractor: ItunesMusicUseCase {
    
    var output: ItunesMusicInteractorOutput!
    
    func fetchMusicList(for searchText: String) {
        
        //Fetch Music List for Search text
        ITunesMusicApiService.fetchMusicList(searchText) { (musicList, isError, errorString) in
            
            //Check for Error
            if !isError {
                
                //No Error
                if let musicListArr = musicList?.results {
                    
                    //List fetched successfully
                    self.output.musicListFetchedSuccessfully(musicListArr)
                } else {
                    
                    //No data Received or data could not be parsed
                    self.output.musicListFetchFailed()
                }
            } else {
                
                //Error
                self.output.musicListFetchFailed()
            }
        }
    }
}
