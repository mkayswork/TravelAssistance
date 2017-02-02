//
//  AppDelegate.swift
//  DB Travel Assistance
//
//  Created by Dat Boi on 18.12.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = .lightContent
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "DB Sans Comp", size: 19)!,
            NSForegroundColorAttributeName: UIColor.white,
        ]
        
//        DBAPIRequester.sharedRequester.searchForStationWithName(name: "Frankfurt") { (data, error) in
//            
//        }
        // "https:\/\/open-api.bahn.de\/bin\/rest.exe\/v1.0\/journeyDetail?ref=25512%2F13306%2F199018%2F91005%2F80%3Fdate%3D2017-02-02%26station_evaId%3D8000105%26station_type%3Darr%26authKey%3DTestDemoAPI16%26lang%3Dde%26format%3Djson%26"
        
        
        DBAPIRequester.sharedRequester.makeAPISeriesCallWithURLString(urlString: "https://open-api.bahn.de/bin/rest.exe/v1.0/journeyDetail?ref=554313%2F186986%2F678946%2F154702%2F80%3Fdate%3D2017-02-02%26station_evaId%3D8000105%26station_type%3Darr%26authKey%3DTestDemoAPI16%26lang%3Dde%26format%3Djson%26") { (json, error) in
            
            if json != nil {
                print(json!)
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

