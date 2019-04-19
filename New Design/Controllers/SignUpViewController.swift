//
//  SignInViewController.swift
//  New Design
//
//  Created by Kingdom Vision on 12/7/1397 AP.
//  Copyright © 1397 Kingdom Vision. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var signInWithFacebook: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.signInWithFacebook.layer.borderColor = UIColor.init(red: 178/255, green: 166/255, blue: 131/255, alpha: 1).cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInBtn(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
//        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func backBtn(_ sender: Any) {
    
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
