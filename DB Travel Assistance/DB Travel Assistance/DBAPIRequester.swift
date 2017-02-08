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

typealias RequestFinishedCompletion = (_ json: JSON?, _ error: Error?) -> Void

public class DBAPIRequester {
    static let sharedRequester = DBAPIRequester()
    private init(){}
    
    /// standardParameters
    
/// MARK: ********** properties **********
    private var standardParameters: Parameters = ["format": jsonFormat,"lang": language, "authKey": apiKey]

/// MARK: ********** apiCalls **********
    func searchForStationWithName(name: String, completion: @escaping RequestFinishedCompletion) {
        
        let parameters: Parameters = ["input" : name]
        let finalParameters = prepareParameters(parameters: parameters)
        let finalURLString = baseAPIURLString + stationSearchURLString
        
        makeAPICallWithURLString(urlString:  finalURLString, parameters: finalParameters) { (json, error) in
            if json != nil {
                completion(json, nil)
            }
            if error != nil {
                completion(nil, error)
            }
        }
    }
    
    func searchForArrivalBoardWithStationId(id: String, completion: @escaping RequestFinishedCompletion){
        let parameters: Parameters = ["id": id]
        let finalParameters = prepareParameters(parameters: parameters)
        let finalURLString = baseAPIURLString + arrivalBoardURLString
        
        makeAPICallWithURLString(urlString:  finalURLString, parameters: finalParameters) { (json, error) in
            if json != nil {
                completion(json, nil)
            }
            if error != nil {
                completion(nil, error)
            }
        }
    }
    
    func searchForDepartureBoardWithStationId(id: String, completion: @escaping RequestFinishedCompletion){
        let parameters: Parameters = ["id": id]
        let finalParameters = prepareParameters(parameters: parameters)
        let finalURLString = baseAPIURLString + departureBoardURLString
        
        makeAPICallWithURLString(urlString:  finalURLString, parameters: finalParameters) { (json, error) in
            if json != nil {
                completion(json, nil)
            }
            if error != nil {
                completion(nil, error)
            }
        }
        
    }
    

    // IMPORTANT NOTICE: WHEN RECEIVING A SERIES CALL FROM RESPONSE.DATA, DELETE THE BACKSLASHES!!!
    
    private func makeAPISeriesCallWithURLString(urlString: String, completion: @escaping RequestFinishedCompletion){
        
        makeAPICallWithURLString(urlString: urlString) { (json, error) in
            if json != nil {
                completion(json, nil)
            }
            if error != nil {
                completion(nil, error)
            }
        }
    }
    
/// MARK: ********** privateMethods **********
    // Add specified parameters to standard parameters
    // call DB APi with finalized parameters
    private func makeAPICallWithURLString(urlString: String, parameters: Parameters? = nil, completion: @escaping RequestFinishedCompletion){
        
        Alamofire.request(urlString, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            
            if response.error != nil {
                completion(nil,response.error)
            } else {
                let json = JSON(data: response.data!)
                completion(json,nil)
            }
            
        }
    }
    
    private func prepareParameters(parameters: Parameters) -> Parameters{
        
        var finalParameters = standardParameters
        
        for param in parameters {
            finalParameters[param.key] = param.value
        }
        
        return finalParameters
    }
    

    
    
}
