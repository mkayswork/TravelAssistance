//
//  FavoritesViewController.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {


    @IBOutlet var tableView: UITableView!
    
    var savedStationConnections = [StationConnection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedStationConnections = UserDefaultsHandler.sharedHandler.getSavedStationsFromDefaults()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddFavoriteViewController {
            
            let controller = segue.destination as! AddFavoriteViewController
            controller.delegate = self
        }
    }
}


extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyTravelChooseTrainRideTableViewCell
        
        let stationConnection = savedStationConnections[indexPath.row]
        
        cell.sourceLocation.text = stationConnection.sourceStation.name
        cell.destinationLocation.text = stationConnection.targetDestination.name
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedStationConnections.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            UserDefaultsHandler.sharedHandler.deleteStationConnectionsAtIndex(index: indexPath.row)
            self.savedStationConnections.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
}

extension FavoritesViewController: FavoriteStationAddedDelegate{
    func addedNewFavorite() {
        savedStationConnections = UserDefaultsHandler.sharedHandler.getSavedStationsFromDefaults()
        self.tableView.reloadData()
    }
}
