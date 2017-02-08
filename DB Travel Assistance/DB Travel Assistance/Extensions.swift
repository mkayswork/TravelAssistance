//
//  Extensions.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 04.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import Foundation
import UIKit

private let kSearch = "Suche"
private let kCancel = "Abbrechen"

extension UISearchController {
    
    /// Adds a search bar to given object at a specified viewController. The searchBar has a modified UI to fit the current design. DO NOT FORGET TO SET THE UISEARCHRESULTSUPDATER TO THE OBJECT WITHIN THE VC
    ///
    /// - Parameters:
    ///   - object: the object the searchController will be added to
    ///   - viewController: the object's ViewController
    func addSearchBarToObjectAtViewController(object: AnyObject, viewController: UIViewController){
        
        switch object{
        case is UITableView:
            let object = object as! UITableView
            object.tableHeaderView = self.searchBar
        default:
            break
        }
        
        self.extendedLayoutIncludesOpaqueBars = true // searchbar stays at its position
        self.dimsBackgroundDuringPresentation = false
        self.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        self.searchBar.placeholder = kSearch
        
        self.searchBar.isTranslucent = false
        //self.searchBar.backgroundImage = UIImage(named: "BlueBackground")!
        self.searchBar.setValue("\(kCancel)", forKey: "_cancelButtonText")
        self.searchBar.tintColor = UIColor.white
        
    }
}
