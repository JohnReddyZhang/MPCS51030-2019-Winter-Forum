//
//  ViewController.swift
//  ForgetMeNot
//
//  Created by Susan Stevens on 3/11/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var count = 0
    
    @IBAction func didTapScheduleNotification(_ sender: UIButton) {
        count += 1
        NotificationHelper.shared.sendNotification(withCount: count)
    }
}
