//
//  IndicatableViewExtension.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 29/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit
import PKHUD


extension IndicatableView where Self: UIViewController {
    
    func showActivityIndicator() {
        HUD.show(.progress)
    }
    
    func hideActivityIndicator() {
        HUD.hide()
    }
}
