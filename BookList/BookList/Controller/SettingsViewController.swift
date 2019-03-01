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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = UserDefaults.standard.string(forKey: "name")
        receiveEmailsSwitch.setOn(UserDefaults.standard.bool(forKey: "isReceivingEmails"), animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(receiveEmailsSwitch.isOn, forKey: "isReceivingEmails")
    }
    
    @IBAction func didUpdateName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}
