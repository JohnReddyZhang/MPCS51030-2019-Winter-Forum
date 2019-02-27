//
//  AddBookViewController.swift
//  BookList
//
//  Created by Susan Stevens on 2/24/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    var book: Book?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        book = Book(title: titleTextField.text,
                    author: authorTextField.text,
                    category: BookCategory(rawValue: categorySegmentedControl.selectedSegmentIndex))
    }
    
    @IBAction func didUpdateTitle(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func didUpdateAuthor(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}
