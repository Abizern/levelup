//
//  RingsView.swift
//  levelup
//
//  Created by Gemma Barrett on 31/08/2016.
//  Copyright © 2016 Gem Barrett. All rights reserved.
//

import UIKit
import CoreGraphics

class RingsView: UIView {
    
    var endRing:CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var ringStrokeWidth:CGFloat = 10.0
    var ringColour = UIColor.red
    var ringBackgroundColour = UIColor.black
    
    override func draw(_ rect: CGRect) {
        let fullLoop = 2.0 * CGFloat(M_PI)
        let start:CGFloat = -0.25 * fullLoop
        let end:CGFloat = endRing * fullLoop + start
        
        let middleBit = CGPoint(x: rect.midX, y: rect.midY)
        
        var radius:CGFloat = 0.0
        if rect.width > rect.height {
            radius = (rect.width - ringStrokeWidth) / 2.0
        } else {
            radius = (rect.height - ringStrokeWidth) / 2.0
        }
        
        let context = UIGraphicsGetCurrentContext()
        
//        let colours = CGColorSpaceCreateDeviceRGB()
        
        context?.setLineWidth(ringStrokeWidth)
        context?.setLineCap(CGLineCap.round)
        
        // dark shadow
        context?.setStrokeColor(ringBackgroundColour.cgColor)
        context?.addArc(center:CGPoint(x: middleBit.x, y:middleBit.y), radius: radius, startAngle: 0, endAngle: fullLoop, clockwise: false )
//        CGContextAddArc(context, middleBit.x, middleBit.y, radius, 0, fullLoop, 0)
        context?.strokePath()
        
        // red ring
        context?.setStrokeColor(ringColour.cgColor)
        // reduce width of stroke a bit so the background shows
        context?.setLineWidth(ringStrokeWidth * 0.8)
        context?.addArc(center:CGPoint(x: middleBit.x, y:middleBit.y), radius: radius, startAngle: start, endAngle: end, clockwise: false )
//        CGContextAddArc(context, middleBit.x, middleBit.y, radius, start, end, 0)
        context?.strokePath()
        
    }

}
