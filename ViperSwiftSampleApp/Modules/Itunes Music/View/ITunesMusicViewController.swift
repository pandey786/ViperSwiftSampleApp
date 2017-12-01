//
//  ITunesMusicViewController.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 01/12/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import UIKit

class ITunesMusicViewController: UIViewController {

    var presenter: ItunesMusicPresentation!
    
    //Search Controller
    let searchController = UISearchController.init(searchResultsController: nil)
    
    @IBOutlet weak var tableView: UITableView!
    
    //DataSource
    var musicList: [ItunesMusicModel] = [] {
        
        didSet{
         
            //reload Table
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Up View
        setUpView()

        fetchMusicList(for: "Salman Khan")
    }
    
    func setUpView() {
        
        //set Navigation Bar
        setupNavigationBar()
        
        //set Dynamic height Of table View
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //register Nib
        tableView.register(UINib.init(nibName: "ITunesMusicTableViewCell", bundle: nil), forCellReuseIdentifier: "ITunesMusicTableViewCell")
        
        //set up Search Controller
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
    }
    
    func setupNavigationBar() {
        
        //Set Large Title for Navigation Bar
        self.title = "ITunes Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        
        //Change Fontcolor for Large navigation Title
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.darkGray]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
    }
    
    func fetchMusicList(for searchText: String) {
        
        clearLastSearchedData()
        presenter.fetchMusicList(for: searchText)
    }
 }

extension ITunesMusicViewController: ItunesMusicView {
    
    func showMusicList(_ musicList: [ItunesMusicModel]) {
        self.musicList = musicList
        
        //reload Table
        self.tableView.reloadData()
    }
    
    func showNoContentScreen() {
        
        //show no content screen
    }
    
    func clearLastSearchedData() {
        
        //remove existing Data
        self.musicList.removeAll()
        
        //Reload Table
        tableView.reloadData()
    }
}

extension ITunesMusicViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let musicCell: ITunesMusicTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ITunesMusicTableViewCell") as! ITunesMusicTableViewCell
        
        let musicModel = self.musicList[indexPath.row]
        musicCell.setUpCell(musicModel)
        
        musicCell.selectionStyle = .none
        
        return musicCell
    }
}

//MARK:- Search Controller
extension ITunesMusicViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //Fetch Train Route
        guard let searchtext = searchController.searchBar.text else {
            return
        }
        
        if searchtext.count > 0 {
            
            //Fetch Route
            self.fetchMusicList(for: searchtext)
        } else {
            
            //Present Alert
            let alertCtrl = UIAlertController.init(title: "Alert", message: "Please Enter Something to Search", preferredStyle: .alert)
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
