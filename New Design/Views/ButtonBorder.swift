//
//  UIButton.swift
//  EasyShopping
//
//  Created by admin on 11/11/2017.
//  Copyright © 2017 MuhammadAamir. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class ButtonBorder: UIButton {
    
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = self.width
        self.layer.borderColor = self.color.cgColor
        self.layer.cornerRadius = cornerRadius
        
        if self.isCrile{
            self.layer.cornerRadius = self.frame.width/2
            self.layer.borderColor = self.color.cgColor
            self.layer.borderWidth = self.width
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.isCrile{
            self.layer.cornerRadius = self.frame.width/2
            self.layer.borderColor = self.color.cgColor
            self.layer.borderWidth = self.width
        }
    }
    
    @IBInspectable var isCrile: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 20.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var width:CGFloat = 1 {
        didSet{
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var color:UIColor = UIColor.black {
        didSet{
            self.setNeedsDisplay()
        }
    }
}
