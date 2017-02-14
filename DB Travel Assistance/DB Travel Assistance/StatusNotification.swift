//
//  StatusNotification.swift
//  DB Travel Assistance
//
//  Created by Dat Boi on 14.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import Foundation
import UIKit

enum StatusNotificationCategory: String {
    case Umleitung = "Umleitung"
    case Freitext = "Freitext"
    case Ausfall = "Ausfall"
    case Streckenstoerung = "Streckenstoerung"
    case Stoerung = "Stoerung"
}

class StatusNotification {
    
    var time: String
    var category: StatusNotificationCategory
    var messageTitle: String
    var messageText: String
    
    init(time: String, category: StatusNotificationCategory, messageTitle: String, messageText: String) {
        self.time = time
        self.category = category

        self.messageTitle = messageTitle
        self.messageText = messageText
    }
    
}
