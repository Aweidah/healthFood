//
//  BorderedView.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/6/22.
//

import Foundation
import UIKit

//@IBDesignable
class BorderedView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 8
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var borderColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.0
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
    }
    
}
