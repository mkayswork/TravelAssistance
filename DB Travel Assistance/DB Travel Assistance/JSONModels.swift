//
//  JSONModels.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 04.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import Foundation
import SwiftyJSON
import MapKit

class Station: NSObject, NSCoding {
    var name: String
    var id: String
    var longitude: Double
    var latitude: Double
    
    init(name: String, id: String, longitude: Double, latitude: Double) {
        self.name = name
        self.id = id
        self.longitude = longitude
        self.latitude = latitude
    }
    
    required init(coder decoder: NSCoder){
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.id = decoder.decodeObject(forKey: "id") as? String ?? ""
        self.longitude = decoder.decodeObject(forKey: "longitude") as? Double ?? 0
        self.latitude = decoder.decodeObject(forKey: "latitiude") as? Double ?? 0
    }
    
    func encode(with coder: NSCoder){
        coder.encode(name, forKey: "name")
        coder.encode(id, forKey: "id")
        coder.encode(longitude, forKey: "longitude")
        coder.encode(latitude, forKey: "latitude")
    }
}

class StationConnection: NSObject, NSCoding{
    var sourceStation: Station
    var targetDestination: Station
    
    init(sourceStation: Station, targetDestination: Station) {
        self.sourceStation = sourceStation
        self.targetDestination = targetDestination
    }
    
    required init(coder decoder: NSCoder){
        self.sourceStation = (decoder.decodeObject(forKey: "sourceStation") as? Station)!
        self.targetDestination = (decoder.decodeObject(forKey: "targetDestination") as? Station)!
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(sourceStation, forKey: "sourceStation")
        coder.encode(targetDestination, forKey: "targetDestination")
    }
}


class JSONHandler {
    class func convertStationJSONToCustomClass(json: JSON) -> [Station] {
        var stations = [Station]()
        
        let receivedStations = json["LocationList"]["StopLocation"]
        
        for stat in receivedStations{
            
            let name = stat.1["name"].string!
            let id = stat.1["id"].string!
            let latitude = Double(stat.1["lat"].string!)!
            let longitude = Double(stat.1["lon"].string!)!
            
            let station = Station(name: name, id: id, longitude: longitude, latitude: latitude)
            
            stations.append(station)
        }
        
        return stations
    }
    
}
