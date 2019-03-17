//
//  DrawingViewController.swift
//  CleanCodeDemo
//
//  Created by Susan Stevens on 3/3/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var creationDateLabel: UILabel!
    
    var drawing: Drawing?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let drawing = drawing else { return }
        imageView.image = drawing.image
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let formattedDate = dateFormatter.string(from: drawing.creationDate)
        creationDateLabel.text = "Created on \(formattedDate)"
    }
}
