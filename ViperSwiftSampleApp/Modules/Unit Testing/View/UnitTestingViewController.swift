//
//  UnitTestingViewController.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 07/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import UIKit

class UnitTestingViewController: UIViewController {

    var presenter: UnitTestingPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        //fetch Data
        presenter.fetchUnitTestData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UnitTestingViewController: UnitTestingView {
    
    func showUnitTestData(_ unitTestData: [UnitTestModel]) {
        
        //Show Data On Screen
        print(unitTestData)
    }
    
    func showNoContentScreen() {
        
        //Show no content screen
    }
}

