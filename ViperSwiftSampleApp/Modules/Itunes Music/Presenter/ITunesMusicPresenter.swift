//
//  ITunesMusicPresenter.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 01/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation

class ItunesMusicPresenter: ItunesMusicPresentation {

    var view: ItunesMusicView?
    var interactor: ItunesMusicUseCase!
    var router: ItunesMusciWireframe!
    
    //DataSource
    var musicList: [ItunesMusicModel] = [] {
        
        didSet {
            if self.musicList.count > 0 {
                view?.showMusicList(self.musicList)
            } else {
                view?.showNoContentScreen()
            }
        }
    }
    
    func viewDidLoad() {
        
    }
    
    func fetchMusicList(for searchText: String) {
        
        interactor.fetchMusicList(for: searchText)
        view?.showActivityIndicator()
    }
    
}

extension ItunesMusicPresenter: ItunesMusicInteractorOutput {
    
    func musicListFetchedSuccessfully(_ musicList: [ItunesMusicModel]) {
        
        self.musicList = musicList
        view?.hideActivityIndicator()
        view?.showMusicList(musicList)
    }
    
    func musicListFetchFailed() {
        view?.hideActivityIndicator()
        view?.showNoContentScreen()
    }
}
