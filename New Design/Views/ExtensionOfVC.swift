//
//  ExtensionOfVC.swift
//  NearbyPlaces
//
//  Created by Muhammad Ahmed Baig on 06/10/2018.
//  Copyright © 2018 Bilal Bhutta. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    ///return back bar button which are using in whole app
    func backBarButton() -> UIBarButtonItem {
        let backButtonItem = UIBarButtonItem(image: UIImage(named:"back"), style: .plain, target: self, action: #selector(BackButtonTapped))
        return backButtonItem
    }
    
    ///Back Btn Action
    @objc func BackButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
}
