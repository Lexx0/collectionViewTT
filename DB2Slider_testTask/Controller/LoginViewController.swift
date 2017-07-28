//
//  LoginViewController.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/27/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var passWordTxtFld: UITextField!
    @IBOutlet weak var warningLbl: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialConfig()
        
        todaysDate()
    }

    func initialConfig() {

        self.userNameTxtFld.text! = "iostest"
        self.passWordTxtFld.text! = "iostest2k17!"
        self.warningLbl.text = "wrong userName / pass"
        self.warningLbl.textColor = .red
        self.warningLbl.isHidden = true
        self.okBtn.setTitle("OK", for: .normal)
    }

    @IBAction func okBtnTapped(_ sender: Any) {
        
        sessionManager.request(CHANNELS_URL).authenticate(user: userNameTxtFld.text!, password: passWordTxtFld.text!).responseJSON { response in
            
            guard (response.result.isSuccess == true) else {
                self.warningLbl.isHidden = false
                return
            }
            
            user0 = self.userNameTxtFld.text!
            pass0 = self.passWordTxtFld.text!
            
            self.performSegue(withIdentifier: "goto_ZeroNavController", sender: self)
        }
    }
    
    func todaysDate() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        timeZero = formatter.string(from: date)
        
        let yesterday = Date().yesterday
        dayBefore = formatter.string(from: yesterday)
    }
}



extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.userNameTxtFld || textField == self.passWordTxtFld {
            self.warningLbl.isHidden = true
            print("piu")
        }
    }
}
