//
//  RootRouter.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 21/01/17.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    
    func presentHomeScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = HomeRouter.assembleModule()
    }
}
