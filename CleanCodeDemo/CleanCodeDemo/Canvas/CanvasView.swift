//
//  CanvasView.swift
//  CleanCodeDemo
//
//  Created by Susan Stevens on 3/3/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

// Used a few ideas from:
// https://www.raywenderlich.com/5895-uikit-drawing-tutorial-how-to-make-a-simple-drawing-app
class CanvasView: UIImageView {
    
    var previousPoint = CGPoint.zero
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        switch (sender.state) {
        case .began:
            previousPoint = sender.location(in: self)
        case .changed:
            UIGraphicsBeginImageContext(frame.size)
            guard let context = UIGraphicsGetCurrentContext() else { return }
            
            let currentPoint = sender.location(in: self)
            
            image?.draw(in: bounds)
            
            context.move(to: previousPoint)
            context.addLine(to: currentPoint)
            
            context.setLineCap(.round)
            context.setLineWidth(10)
            context.setStrokeColor(UIColor.red.cgColor)
            context.strokePath()
            
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            previousPoint = currentPoint
        default:
            return
        }
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        UIGraphicsBeginImageContext(frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        image?.draw(in: bounds)
        
        context.addEllipse(in: CGRect(origin: sender.location(in: self),
                                      size: CGSize(width: 10, height: 10)))
        
        context.setFillColor(UIColor.red.cgColor)
        context.fillPath()
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}
