//
//  AddFavoriteViewController.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit
enum StationContext {
    case source
    case target
}

protocol FavoriteStationAddedDelegate {
    func addedNewFavorite()
}

class AddFavoriteViewController: UIViewController {
    
    @IBOutlet var sourceValue: UILabel!
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    var stationContext = StationContext.source
    
    let searchController = UISearchController(searchResultsController: nil)
    var stations = [Station]()
    
    var sourceDestination: Station?
    var targetDestination: Station?
    

    var delegate: FavoriteStationAddedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.addSearchBarToObjectAtViewController(object: self.tableView, viewController: self)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.saveButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        let stationConnection = StationConnection(sourceStation: sourceDestination!, targetDestination: targetDestination!)
        
        UserDefaultsHandler.sharedHandler.saveStationConnectionToDefaults(stationConnection: stationConnection)
        
        delegate?.addedNewFavorite()
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                self.stationContext = StationContext.source
            case 1:
                self.stationContext = StationContext.target
            default: break
        }
    }
    
    func updateSelectedStations(){
        if sourceDestination != nil {
            sourceValue.text = sourceDestination!.name
        }
        
        if targetDestination != nil {
            destinationLabel.text = targetDestination!.name
        }
        if (targetDestination != nil && sourceDestination != nil){
            self.saveButton.isEnabled = true
        }
    }
}

extension AddFavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel?.font = UIFont(name: "DB Sans Comp", size: 17)
        let station = stations[indexPath.row]
        cell.textLabel?.text = station.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stations.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedStation = self.stations[indexPath.row]
        switch stationContext {
            
            case .source:
                sourceDestination = selectedStation
            case .target:
                targetDestination = selectedStation
        }
        
        self.updateSelectedStations()
    }
}

extension AddFavoriteViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
    
    }
    
    func updateSearchResults(for searchController: UISearchController) {
            filterContentForSearchText(self.searchController.searchBar.text!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.searchBar.isUserInteractionEnabled = false
        DBAPIRequester.sharedRequester.searchForStationWithName(name: searchBar.text!) { (json, error) in
            self.stations = JSONHandler.convertStationJSONToCustomClass(json: json!)
            self.searchController.searchBar.isUserInteractionEnabled = true
            print(self.stations)
            self.tableView.reloadData()
        }
    }
}
