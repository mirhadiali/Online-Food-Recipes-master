//
//  PopUpViewController.swift
//  New Design
//
//  Created by Kingdom Vision on 1/1/1398 AP.
//  Copyright © 1398 Kingdom Vision. All rights reserved.
//

import UIKit


class PopUpViewController: CustomViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var kuchbhi: UIButton!
    @IBOutlet weak var contentview2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.setShadow(contentView: contentView)
        Utilities.setShadow(contentView: contentview2)
        
        self.dismissAnimated()
    }
    
   
    
    @IBAction func kuchBhibtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
