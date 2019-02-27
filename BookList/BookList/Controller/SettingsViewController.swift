//
//  SettingsViewController.swift
//  BookList
//
//  Created by Susan Stevens on 2/24/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var receiveEmailsSwitch: UISwitch!
    
    @IBAction func didUpdateName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}
