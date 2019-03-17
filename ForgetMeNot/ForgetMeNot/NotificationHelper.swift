//
//  NotificationHelper.swift
//  ForgetMeNot
//
//  Created by Susan Stevens on 3/11/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UserNotifications

class NotificationHelper {
    
    static let shared = NotificationHelper()
    
    private init() {}
    
    private let categoryIdentifier = "greetings"
    
    func requestAuthorizationIfNeeded() {
        // check current notification settings
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            
            // only ask for authorization if current status is "not determined"
            guard settings.authorizationStatus == .notDetermined else { return }
            
            // request authorization to send alerts and sounds
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (isGranted, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                print("User granted notification authorization: \(isGranted)")
                self.setGreetingsCategory()
            }
        }
    }
    
    func sendNotification(withCount count: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Hello 👋"
        content.body = "I'm a notification"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = categoryIdentifier
        content.userInfo = ["count": count]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(
            identifier: "notification-\(count)",
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            print("Notification \(count) - Scheduled")
        }
    }
    
    private func setGreetingsCategory() {
        let helloAction = UNNotificationAction(identifier: "hello-identifier",
                                               title: "Hello",
                                               options: [])
        
        let goodbyeAction = UNNotificationAction(identifier: "goodbye-identifier",
                                                 title: "Goodbye",
                                                 options: [])

        let category = UNNotificationCategory(identifier: categoryIdentifier,
                                              actions: [helloAction, goodbyeAction],
                                              intentIdentifiers: [],
                                              hiddenPreviewsBodyPlaceholder: nil,
                                              categorySummaryFormat: nil)
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
}
