//
//  UserdefaultsHandler.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 05.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import Foundation


class UserDefaultsHandler {
    static let sharedHandler = UserDefaultsHandler()
    private init(){}
    
    func setInitialStationConnectionsForFirstAppStart(){
        let userDefaults = UserDefaults.standard
        let stationConnections = [StationConnection]()
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: stationConnections)
        
        userDefaults.setValue(encodedData, forKey: "Favorites")
        userDefaults.synchronize()
    }
    
    // adds a new stationConnection to NSUserDefaults
    func saveStationConnectionToDefaults(stationConnection: StationConnection){
        
        let userDefaults = UserDefaults.standard
        
        
        var stationConnections = self.getSavedStationsFromDefaults()
        
        stationConnections.append(stationConnection)
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: stationConnections)
        
        userDefaults.setValue(encodedData, forKey: "Favorites")
        userDefaults.synchronize()
    }
    
    func getSavedStationsFromDefaults() -> [StationConnection]{
        let userDefaults = UserDefaults.standard
        
        
        let decoded  = userDefaults.object(forKey: "Favorites") as! Data
        let decodedStationConnections = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [StationConnection]
        
        return decodedStationConnections
    }
    
    func deleteStationConnectionsAtIndex(index: Int){
        let userDefaults = UserDefaults.standard
        
        let decoded  = userDefaults.object(forKey: "Favorites") as! Data
        var decodedStationConnections = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [StationConnection]
        
        decodedStationConnections.remove(at: index)
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: decodedStationConnections)
        
        userDefaults.setValue(encodedData, forKey: "Favorites")
        userDefaults.synchronize()
    }
}
