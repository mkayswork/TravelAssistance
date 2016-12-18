//
//  IBInspectable.swift
//  DB Travel Assistance
//
//  Created by Dat Boi on 18.12.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return self.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderColor : UIColor {
        
        get {
            return self.borderColor
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth : Int {
        
        get {
            return self.borderWidth
        }
        set {
            self.borderWidth = newValue
        }
    }
}

@IBDesignable
extension UITableViewController {
    
    
    
    /// Changes the color of the section headers text to specified color
    @IBInspectable var sectionHeaderFontColor: UIColor {
        get {
            return self.sectionHeaderFontColor
        }
        
        set {
            for section in 0..<tableView.numberOfSections {
                self.tableView.headerView(forSection: section)?.textLabel?.textColor = newValue
            }
            
        }
    }
}
