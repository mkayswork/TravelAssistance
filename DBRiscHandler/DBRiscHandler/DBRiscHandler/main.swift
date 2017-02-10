//
//  main.swift
//  DBRiscHandler
//
//  Created by Matthias Kühnel on 06.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import Foundation

func searchXMLWithWords(keyWords: [String], valueWords: [String]) {
    
    let fileManager = FileManager.default
    let xmlParser = XMLDictionaryParser.sharedInstance()
    
    let path = "/Users/datboi/Desktop/TravelAssistance/DBRiscHandler/DBRiscHandler/dataTest"
    //let subFiles = fileManager.subpaths(atPath: path)!
    let enumerator:FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: path)!
    
    var relevantDicts = [[String: Any]]()
    var relevantFiles =  [String]()
    
    
    // filter for relevant keyWords
    for file in enumerator {
        
        if (file as AnyObject).hasSuffix(".xml") {
            
            xmlParser.nodeNameMode = .always
            let fileAsDictionary = xmlParser.dictionary(withFile: path + "/" + ((file as AnyObject) as! String) as String)
            
            
            
            for (key, value) in fileAsDictionary!{
                
                
                for keyWord in keyWords {
                    if key.contains(keyWord){
                        relevantDicts.append(fileAsDictionary!)
                        break
                    }
                    if let val = value as? String {
                        if val.contains(keyWord){
                            relevantDicts.append(fileAsDictionary!)
                            relevantFiles.append(path + "/" + ((file as AnyObject) as! String) as String)
                            
                        }
                        
                    }
                }
                
            }
        }
    }
    
    //    for dic in relevantDicts{
    //        for (_,value) in dic {
    //
    //            valueWords.forEach({valueWord in
    //
    //                if let val = value as? String{
    //                    if val.contains(valueWord){
    //                        print(dic)
    //                    }
    //                }
    //
    //            })
    //        }
    //    }
}

let keyWords = ["Anschluss","Freitext","Stoerung","Umleitung","Ausfall"]
let valueWords = ["Frankfurt", "Koeln"]

searchXMLWithWords(keyWords: keyWords, valueWords: valueWords)



