//
//  RecipesCollectionViewCell.swift
//  New Design
//
//  Created by Kingdom Vision on 12/10/1397 AP.
//  Copyright © 1397 Kingdom Vision. All rights reserved.
//

import UIKit

class RecipesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var foodType: UILabel!
    
    override func awakeFromNib() {
        contentView.layer.cornerRadius = 15.0
        contentView.layer.borderWidth = 0.0
      //  contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.masksToBounds = true
        
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.init(width: 0, height: 5)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.7
        layer.masksToBounds = false
        layer.shouldRasterize = true
      //  layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
        

    }
}
