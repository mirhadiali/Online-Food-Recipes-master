//
//  CodeVerificationViewController.swift
//  New Design
//
//  Created by Kingdom Vision on 12/8/1397 AP.
//  Copyright © 1397 Kingdom Vision. All rights reserved.
//

import UIKit

class CodeVerificationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tF1: UITextField!
    @IBOutlet weak var tF2: UITextField!
    @IBOutlet weak var tF3: UITextField!
    @IBOutlet weak var tF4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tF1.delegate = self
        tF2.delegate = self
        tF3.delegate = self
        tF4.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        tF1.becomeFirstResponder()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count)! < 1 && string.count > 0{
            switch textField {
            case tF1:
                tF2.becomeFirstResponder()
            case tF2:
                tF3.becomeFirstResponder()
            case tF3:
                tF4.becomeFirstResponder()
            case tF4:
                tF4.resignFirstResponder()
               
            default:
                break
            }
            textField.text = string
           otpVerified()
            return false
        }
        else if (textField.text?.count)! >= 1 && string.count == 0{
            switch textField {
            case tF2:
                tF1.becomeFirstResponder()
            case tF3:
                tF2.becomeFirstResponder()
            case tF4:
                tF3.becomeFirstResponder()
            case tF1:
                tF1.becomeFirstResponder()
            default:
                break
            }
            textField.text = ""
            otpVerified()
            return false
        }
        else if (textField.text?.count)! >= 1{
            textField.text = string
           otpVerified()
            return false
        }
        return true
    }
    
    func otpVerified(){
        if tF1.text != "" && tF2.text != "" && tF3.text != "" && tF4.text != ""{
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RecipesViewController") as? RecipesViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
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
