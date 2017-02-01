//
//  DBAPIRequester.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

private let baseAPIURLString:String = "https://open-api.bahn.de/bin/rest.exe/"
private let departureBoard:String = "departureBoard"
private let jsonFormat:String = "json"
private let language:String = "de"

private let apiKey = "TestDemoAPI16"

import Foundation
import Alamofire
import SwiftyJSON

public class DBAPIRequester {
    static let sharedRequester = DBAPIRequester()
    private init(){}
    //https://open-api.bahn.de/bin/rest.exe/departureBoard?format=json&lang=de&id=008000105&date=2017-01-02&time=20%3A14&authKey=TestDemoAPI16
    //https://open-api.bahn.de/bin/rest.exe/departureBoard?date=2017-01-02&format=json&id=008000105&lang=de&time=20%3A14
    
    func testAPICall() {
        
        let parameters: Parameters = ["format": jsonFormat,"lang": language,"id": "008000105","date": "2017-01-02","time": "20:14", "authKey": apiKey]
        
        Alamofire.request(baseAPIURLString + departureBoard, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            print(json)
            
        }
    }
    
}
