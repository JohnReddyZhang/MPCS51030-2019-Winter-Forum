//
//  Drawing.swift
//  CleanCodeDemo
//
//  Created by Susan Stevens on 3/3/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class drawing {
    
    var image: UIImage
    var creationDate: Date
    
    init(image: UIImage, creationDate: Date) {
        self.image = image;
        self.creationDate = creationDate;
    }
}
