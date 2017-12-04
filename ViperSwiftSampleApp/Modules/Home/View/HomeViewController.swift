//
//  HomeViewController.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresentation!
    
    @IBOutlet weak var tableView: UITableView!
    
    //Data Source
    var homeItems: [HomeItem] = [] {
        didSet{
            
            //Reload Table
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view Setup
        setUpView()
        
        //Load View for Presenter
        presenter.viewDidLoad()
    }
    
    func setUpView() {
        
        //set Navigation bar
        setupNavigationBar()
        
        //set Dynamic height Of table View
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //set Deleagtes
        tableView.delegate = self
        tableView.dataSource = self
        
        //register Nib
        tableView.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    func setupNavigationBar() {
        
        //Set Large Title for Navigation Bar
        self.title = "Home"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .never
        
        //Change Fontcolor for Large navigation Title
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.darkGray]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
    }
}

extension HomeViewController: HomeView {
    
    func showNoContentScreen() {
        //Show No Content Screen
    }
    
    func showHomeData(_ homeItems: [HomeItem]) {
        self.homeItems = homeItems
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let homeCell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        
        let homeItem = self.homeItems[indexPath.row]
        homeCell.setUpCell(homeItem)
        
        homeCell.selectionStyle = .none
        
        return homeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Navigate TO Next Screen based on selected Item
        let homeItem = self.homeItems[indexPath.row]
        presenter.didSelectHomeItem(homeItem)
    }
}
