//
//  Line View Mode.swift
//  Instagram
//
//  Created by Shao Kahn on 10/12/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

@IBDesignable
class UIView_Attributes: UIView {

    override func draw(_ rect: CGRect) {
        
        //returns a current CGContext type context
        let cgContext = UIGraphicsGetCurrentContext()
        
        //set line width, let it euqal to line view height
        cgContext?.setLineWidth(1.0)
        
        //set dash line color
        cgContext?.setStrokeColor(UIColor.red.cgColor)
        
        //the dash line - red line width is 10 pt, the between two red lines distance is 3 pt
        let dashArr:[CGFloat] = [10,3]
        
        //phase determine dash line start in head of 10 pt
        cgContext?.setLineDash(phase: 0.0, lengths: dashArr)
        
        //dash line begin point
        cgContext?.move(to: CGPoint(x: self.bounds.origin.x , y: self.bounds.origin.y ))
        
        //dash line end point
        cgContext?.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.origin.y ))
        
        //put dash line to line view
        cgContext?.strokePath()
    }
}

extension UIView{
    
    //can get gradient color in default loaction or actual loacation
    func applyGradient(colours: [UIColor], locations: [NSNumber]? = nil, stP:CGPoint, edP:CGPoint){
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = stP
        gradient.endPoint = edP
        self.layer.insertSublayer(gradient, at: 0)
    }
}
