//
//  SignInViewController.swift
//  New Design
//
//  Created by Kingdom Vision on 12/8/1397 AP.
//  Copyright © 1397 Kingdom Vision. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var textBox: UnderlinedTextField!
    
    @IBOutlet weak var textBox2: UnderlinedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
//        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func forgot(_ sender: Any) {
        textBox2.text = textBox.text
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
