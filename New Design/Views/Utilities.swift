//
//  Utilities.swift
//  NearbyPlaces
//
//  Created by Muhammad Ahmed Baig on 06/10/2018.
//  Copyright © 2018 Bilal Bhutta. All rights reserved.
//

import Foundation
import Swift
import UIKit

class Utilities {

    static func setNavigationBar(vc: UIViewController, isBackBtn: Bool?=true){

        let itemColor = UIColor.white
        if isBackBtn!{
            vc.navigationItem.leftBarButtonItem = vc.backBarButton()
        }
        vc.navigationController?.navigationBar.barTintColor = UIColor.black//color
        vc.navigationController?.navigationBar.backgroundColor = UIColor.black//.getDarkBlueColor//color
        vc.navigationController?.navigationBar.isTranslucent = false
//        vc.navigationController?.navigationBar.shadowImage = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
        
        vc.navigationController?.navigationBar.tintColor = itemColor
//        vc.navigationController?.navigationBar.ti
        
        vc.navigationItem.backBarButtonItem?.tintColor = itemColor
        
        vc.navigationItem.rightBarButtonItem?.tintColor = itemColor
        
        let titleDict: NSDictionary = [NSAttributedString.Key.foregroundColor : itemColor]
        vc.navigationController?.navigationBar.titleTextAttributes = titleDict as? [NSAttributedString.Key : Any]
        vc.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    static func setShadow(contentView:UIView)  {
        contentView.layer.cornerRadius = 15.0
        contentView.layer.borderWidth = 0.0
        //  contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.masksToBounds = true
        
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOpacity = 0.7
        contentView.layer.masksToBounds = false
        contentView.layer.shouldRasterize = true
        //  layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        //contentView.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    
}
