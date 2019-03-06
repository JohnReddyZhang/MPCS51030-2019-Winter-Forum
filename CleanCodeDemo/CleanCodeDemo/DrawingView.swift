//
//  DrawingView.swift
//  CleanCodeDemo
//
//  Created by Susan Stevens on 3/3/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class DrawingView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var creationDateLabel: UILabel!
    
    var drawing: drawing?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // check if the drawing has a value
        guard let drawing = drawing else { return }
        imageView.image = drawing.image
        
        // format the date
        let date_formatter = DateFormatter()
        date_formatter.dateStyle = .long
        let formattedDate = date_formatter.string(from: drawing.creationDate)
        creationDateLabel.text = "Created on \(formattedDate)"
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
