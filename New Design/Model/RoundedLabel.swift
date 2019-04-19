//
//  RoundedLabel.swift
//  Effie
//
//  Created by Danish Rehman on 04/05/2018.
//  Copyright © 2018 Zubair ghori. All rights reserved.
//

import UIKit

class RoundedLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
 */
//    override func draw(_ rect: CGRect) {
//    
//    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
