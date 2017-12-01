//
//  ITunesMusicContractor.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 01/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

protocol ItunesMusicView: IndicatableView {
    
    var presenter: ItunesMusicPresentation! { get set }
    
    func showMusicList(_ musicList: [ItunesMusicModel])
    func showNoContentScreen()
    func clearLastSearchedData()
}

protocol ItunesMusicPresentation: class {
    
    weak var view: ItunesMusicView? { get set }
    var interactor: ItunesMusicUseCase! { get set }
    var router: ItunesMusciWireframe! { get set }
    
    func viewDidLoad()
    func fetchMusicList(for searchText: String)
}

protocol ItunesMusicUseCase: class {
    
    var output: ItunesMusicInteractorOutput! { get set }
    
    func fetchMusicList(for searchText: String)
}

protocol ItunesMusicInteractorOutput: class {
 
    func musicListFetchedSuccessfully(_ musicList: [ItunesMusicModel])
    func musicListFetchFailed()
}

protocol ItunesMusciWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
}
