//
//  NotificationViewController.swift
//  ForgetMeNotContentExtension
//
//  Created by Susan Stevens on 3/12/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var countLabel: UILabel!
    
    func didReceive(_ notification: UNNotification) {
        guard let count = notification.request.content.userInfo["count"] as? Int else { return }
        countLabel.text = "Notification #\(count)"
    }
}
