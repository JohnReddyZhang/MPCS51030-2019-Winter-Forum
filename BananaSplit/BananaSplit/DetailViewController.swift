//
//  DetailViewController.swift
//  BananaSplit
//
//  Created by Susan Stevens on 2/11/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var ingredient: Ingredient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ingredient = ingredient {
            imageView.image = ingredient.image
            label.text = ingredient.name
        }
    }
}
