//
//  RecipesTableViewCell.swift
//  New Design
//
//  Created by Kingdom Vision on 12/10/1397 AP.
//  Copyright © 1397 Kingdom Vision. All rights reserved.
//

import UIKit
import Cosmos

class RecipesTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var discription: UILabel!
    
    override func prepareForReuse() {
        ratingView.prepareForReuse()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ratingView.settings.updateOnTouch = false

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
