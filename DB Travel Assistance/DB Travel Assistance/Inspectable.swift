//
//  Inspectable.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 05.01.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationItem {

    @IBInspectable var titleColor: UIColor {
        get {
            return self.titleColor
        }
        set {
            self.titleColor = newValue
        }
    }
    
    @IBInspectable var titleFont: UIFont {
        get {
            return self.titleFont
        }
        set {
            self.titleFont = newValue
        }
    }
}
