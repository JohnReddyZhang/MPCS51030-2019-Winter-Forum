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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
       var prev = CGPoint.zero
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        switch (sender.state) {
        case .began:
            prev = sender.location(in: self)
        case .changed:
            UIGraphicsBeginImageContext(frame.size)
            guard let context = UIGraphicsGetCurrentContext() else { return }
            
            let currentPt = sender.location(in: self)
            
            image?.draw(in: bounds)
            
            context.move(to: prev)
            context.addLine(to: currentPt)
            
            context.setLineCap(.round)
            context.setLineWidth(10)
            context.setStrokeColor(UIColor.red.cgColor)
            context.strokePath()
            
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            prev = currentPt
        default:
            return
        }
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer){
        UIGraphicsBeginImageContext(frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        if let i  = image
        {
            i.draw(in: bounds)
        }
        
        context.addEllipse(in: CGRect(
            origin: sender.location(in: self), size: CGSize(width: 10, height: 10)))
        
        context.setFillColor(UIColor.red.cgColor)
        context.fillPath()
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    
    
}
