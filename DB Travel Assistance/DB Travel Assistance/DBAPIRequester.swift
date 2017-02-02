//
//  DBAPIRequester.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

private let baseAPIURLString:String = "https://open-api.bahn.de/bin/rest.exe/"

private let departureBoardURLString = "departureBoard"
private let arrivalBoardURLString = "arrivalBoard"
private let stationSearchURLString = "location.name"

private let jsonFormat:String = "json"
private let language:String = "de"

private let apiKey = "TestDemoAPI16"

import Foundation
import Alamofire
import SwiftyJSON

typealias RequestFinishedCompletion = (_ data: Data?, _ error: Error?) -> Void

public class DBAPIRequester {
    static let sharedRequester = DBAPIRequester()
    private init(){}
    
    /// standard
    private var standardParameters: Parameters = ["format": jsonFormat,"lang": language, "authKey": apiKey]
    
    func searchForStationWithName(name: String, completion: RequestFinishedCompletion) {
        
        let parameters: Parameters = ["input" : name]
        let finalParameters = prepareParameters(parameters: parameters)
        let finalURLString = baseAPIURLString + stationSearchURLString
        
        makeAPICallWithURLString(urlString: finalURLString, parameters: finalParameters)
    }
    
    func searchForArrivalBoardWithStationId(id: String){
        let parameters: Parameters = ["id": "008000105"]
        let finalParameters = prepareParameters(parameters: parameters)
        let finalURLString = baseAPIURLString + arrivalBoardURLString
        
        makeAPICallWithURLString(urlString: finalURLString, parameters: finalParameters)
    }
    
    func testCall(){
        let parameters: Parameters = ["id": "008000105","date": "2017-01-02","time": "20:14"]
        let finalParameters = prepareParameters(parameters: parameters)
        let finalURLString = baseAPIURLString + departureBoardURLString
        
        makeAPICallWithURLString(urlString: finalURLString, parameters: finalParameters)
    }
    
    
    // call DB APi with finalized parameters
    private func makeAPICallWithURLString(urlString: String, parameters: Parameters? = nil){
        
        Alamofire.request(urlString, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            print(json)
        }
    }
    
    // IMPORTANT NOTICE: WHEN RECEIVING A SERIES CALL FROM RESPONSE.DATA, DELETE THE BACKSLASHES!!!
    
    func makeAPISeriesCallWithURLString(urlString: String){
        makeAPICallWithURLString(urlString: urlString, parameters: nil)
    }
    
    // Add specified parameters to standard parameters
    private func prepareParameters(parameters: Parameters) -> Parameters{
        
        var finalParameters = standardParameters
        
        for param in parameters {
            finalParameters[param.key] = param.value
        }
        
        return finalParameters
    }
    

    
    
}
