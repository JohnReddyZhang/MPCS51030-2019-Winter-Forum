//
//  AppDelegate.swift
//  ForgetMeNot
//
//  Created by Susan Stevens on 3/11/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        UNUserNotificationCenter.current().delegate = self
        
        NotificationHelper.shared.requestAuthorizationIfNeeded()
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        // display alert and play sound when notification arrives while app is in foreground
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // handle notification actions
        let count = response.notification.request.content.userInfo["count"] as! Int
        
        if response.actionIdentifier == "hello-identifier" {
            print("Notification \(count) - Hello!")
        } else if response.actionIdentifier == "goodbye-identifier" {
            print("Notification \(count) - Goodbye!")
        }
        
        completionHandler()
    }
}
