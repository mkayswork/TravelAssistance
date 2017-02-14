//
//  PushNotificator.swift
//  DB Travel Assistance
//
//  Created by Dat Boi on 10.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import UserNotificationsUI


class PushNotificator {

    static let sharedInstance = PushNotificator()
    private init(){}
    
    func pushNotificationWithCategoryAndMessageAndDelay(category: String, message: String){
        let content = UNMutableNotificationContent()
        content.title = category
        content.body = message
        content.sound = UNNotificationSound.default()
        content.badge = (UIApplication.shared.applicationIconBadgeNumber + 1) as NSNumber
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(5), repeats: false)
        
        let notificationRequest = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        
        center.add(notificationRequest) { (error) in
            if (error != nil){
                
            }
        }
        
    }
    
}
