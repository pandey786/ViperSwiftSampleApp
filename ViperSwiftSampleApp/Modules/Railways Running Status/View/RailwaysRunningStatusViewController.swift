//
//  RailwaysRouteViewController.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import UIKit

class RailwaysRunningStatusViewController: UIViewController {
    
    var presenter: RailwaysRunningStatusPresentation!
    var isTrainInfoSectionExpanded = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelTrainName: UILabel!
    @IBOutlet weak var lableTrainNumber: UILabel!
    @IBOutlet weak var labelCurrentStatus: UILabel!
    
    //For controlling train info section
    @IBOutlet /*weak*/ var viewTrainInfoHeightConstraint: NSLayoutConstraint!
    @IBOutlet /*weak*/ var labelCurrentStatusBottomConstraint: NSLayoutConstraint!
    
    //Datasource
    var railwaysRunningStatus: RailwaysRunningStatusModel?
    var railwaysRouteList = [TrainRunningStatusRouteModel]()
    
    //Search Controller
    let searchController = UISearchController.init(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view Setup
        setUpView()
        
        //set Default height of info section
        self.viewTrainInfoHeightConstraint.constant = 40
        
        //collapse Train Info Section Initially
        collapseTrainInfoSection()
        
        fetchRailwaysRunningStatus(for: "12149", "04-12-2017")
        
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
        tableView.register(UINib.init(nibName: "RailwaysRunningStatusTableViewCell", bundle: nil), forCellReuseIdentifier: "RailwaysRunningStatusTableViewCell")
        
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
    
    func fetchRailwaysRunningStatus(for trainNumber: String, _ startDate: String) {
        
        clearLastSearchedData()
        presenter.fetchRailwaysRunningStatus(trainNumber, startDate)
    }
    
    @IBAction func toggleTrainInfoSectionState(_ sender: Any) {
        
        isTrainInfoSectionExpanded = !isTrainInfoSectionExpanded
        
        if isTrainInfoSectionExpanded {
            
            //expand Train Info
            expandTrainInfoSection()
        } else {
            
            //collapse Train Info
            collapseTrainInfoSection()
        }
    }
    
    func expandTrainInfoSection() {
        
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.viewTrainInfoHeightConstraint.isActive = false
            self.labelCurrentStatusBottomConstraint.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    func collapseTrainInfoSection() {
        
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.viewTrainInfoHeightConstraint.isActive = true
            self.labelCurrentStatusBottomConstraint.isActive = false
            self.view.layoutIfNeeded()
        }
    }
}

extension RailwaysRunningStatusViewController: RailwaysRunningStatusView {
    
    func showRailwaysRunningStatusData(_ railwaysRunningStatus: RailwaysRunningStatusModel) {
        
        self.railwaysRunningStatus = railwaysRunningStatus
        
        //set Train Data
        self.labelTrainName.text = self.railwaysRunningStatus?.train?.name
        self.lableTrainNumber.text = self.railwaysRunningStatus?.train?.number
        self.labelCurrentStatus.text = self.railwaysRunningStatus?.position

        //get list of routes
        if let routeList = self.railwaysRunningStatus?.route {
            self.railwaysRouteList = routeList
        }
        
        //Reload Table
        tableView.reloadData()
    }
    
    
    func showNoContentScreen() {
        
        //Show no content screen
    }
    
    func clearLastSearchedData() {
        
        //remove existing Data
        self.railwaysRunningStatus = nil
        self.railwaysRouteList.removeAll()
        
        self.labelTrainName.text = ""
        self.lableTrainNumber.text = ""
        
        //Reload Table
        tableView.reloadData()
    }
}

extension RailwaysRunningStatusViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.railwaysRouteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let routeCell: RailwaysRunningStatusTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RailwaysRunningStatusTableViewCell") as! RailwaysRunningStatusTableViewCell
        
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
extension RailwaysRunningStatusViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //Fetch Train Route
        guard let searchtext = searchController.searchBar.text else {
            return
        }
        
        if searchtext.count == 5 {
            
            //Fetch Running Status
            self.fetchRailwaysRunningStatus(for: searchtext, "04-12-2017")
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
