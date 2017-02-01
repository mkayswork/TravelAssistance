//
//  Constants.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 05.01.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    
    static func titleFont () -> UIFont {
        return UIFont(name: "DB Sans Comp", size: 20)!
    }
}

enum AlternativeType{
    case Cheapest
    case Fastest
    case MinimumChanges
}
