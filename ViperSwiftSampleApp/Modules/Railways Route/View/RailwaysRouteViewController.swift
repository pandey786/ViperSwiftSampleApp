//
//  RailwaysRouteViewController.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import UIKit

class RailwaysRouteViewController: UIViewController {
    
    var presenter: RailwaysRoutePresentation!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelTrainName: UILabel!
    @IBOutlet weak var lableTrainNumber: UILabel!
    
    //Datasource
    var railwaysRoute: RailwaysRouteModel?
    var railwaysRouteList = [TrainRouteModel]()
    
    //Search Controller
    let searchController = UISearchController.init(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view Setup
        setUpView()
        
    }
    
    func setUpView() {
        
        //set Navigation Bar
        setupNavigationBar()
        
        //set Dynamic height Of table View
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //set table content Inset
        tableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0)
        
        //register Nib
        tableView.register(UINib.init(nibName: "RailwaysRouteTableViewCell", bundle: nil), forCellReuseIdentifier: "RailwaysRouteTableViewCell")
        
        //set up Search Controller
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
    }
    
    func setupNavigationBar() {
        
        //Set Large Title for Navigation Bar
        self.title = "Train Route"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .never
        
        //Change Fontcolor for Large navigation Title
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.darkGray]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
    }
    
    func fetchRailwaysRoute(for trainNumber: String) {
        
        clearLastSearchedData()
        presenter.fetchRailwaysRoute(trainNumber)
    }
}

extension RailwaysRouteViewController: RailwaysRouteView {
    
    func showNoContentScreen() {
        
        //Show no content screen
    }
    
    func showRailwaysRouteDate(_ railwaysRoute: RailwaysRouteModel) {
        
        self.railwaysRoute = railwaysRoute
        
        //set Train Data
        self.labelTrainName.text = self.railwaysRoute?.train?.name
        self.lableTrainNumber.text = self.railwaysRoute?.train?.number
        
        //get list of routes
        if let routeList = self.railwaysRoute?.route {
            self.railwaysRouteList = routeList
        }
        
        //Reload Table
        tableView.reloadData()
    }
    
    func clearLastSearchedData() {
        
        //remove existing Data
        self.railwaysRoute = nil
        self.railwaysRouteList.removeAll()
        
        self.labelTrainName.text = ""
        self.lableTrainNumber.text = ""
        
        //Reload Table
        tableView.reloadData()
    }
}

extension RailwaysRouteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.railwaysRouteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let routeCell: RailwaysRouteTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RailwaysRouteTableViewCell") as! RailwaysRouteTableViewCell
        
        let routeItem = self.railwaysRouteList[indexPath.row]
        routeCell.setUpCell(routeItem)
        
        //Set up Connectors
        switch indexPath.row {
        case 0:
            routeCell.constraintTopConnectorHeight.constant = 0
            routeCell.constraintBottomConnectorHeight.constant = 20
        case (self.railwaysRouteList.count - 1):
            routeCell.constraintTopConnectorHeight.constant = 20
            routeCell.constraintBottomConnectorHeight.constant = 0
        default:
            routeCell.constraintTopConnectorHeight.constant = 20
            routeCell.constraintBottomConnectorHeight.constant = 20
        }
        
        routeCell.selectionStyle = .none
        
        return routeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK:- Search Controller
extension RailwaysRouteViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //Fetch Train Route
        guard let searchtext = searchController.searchBar.text else {
            return
        }
        
        if searchtext.count == 5 {
            
            //Fetch Route
            self.fetchRailwaysRoute(for: searchtext)
        } else {
            
            //Present Alert
            let alertCtrl = UIAlertController.init(title: "Alert", message: "Please Enter valid Train Number", preferredStyle: .alert)
            alertCtrl.addAction(UIAlertAction.init(title: "Ok", style: .destructive, handler: { (alertAction) in
                
                //Dismiss Alert
                alertCtrl.dismiss(animated: true, completion: {
                })
            }))
            
            self.present(alertCtrl, animated: true, completion: {
            })
        }
    }
}
