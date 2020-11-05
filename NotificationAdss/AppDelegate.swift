//
//  AppDelegate.swift
//  NotificationAdss
//
//  Created by Ivan Dimitrov on 7.10.20.
//
import UIKit
import CoreData
import GoogleMobileAds

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}
