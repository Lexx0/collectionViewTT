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
        
    }

    func initialConfig() {
//        self.userNameTxtFld.text = ""
//        self.passWordTxtFld.text = ""
        self.userNameTxtFld.text! = "iostest"
        self.passWordTxtFld.text! = "iostest2k17!"
        self.warningLbl.text = "Неправильный Логин/Пароль"
        self.warningLbl.isHidden = true
        self.okBtn.setTitle("OK", for: .normal)
    }

    @IBAction func okBtnTapped(_ sender: Any) {
        
        sessionManager.request(CHANNELS_URL).authenticate(user: userNameTxtFld.text!, password: passWordTxtFld.text!).responseJSON { response in
            print("request000 ", CHANNELS_URL,"111", response)
            
            guard (response.result.isSuccess == true) else { self.warningLbl.isHidden = false; return}
            
            user0 = self.userNameTxtFld.text!
            pass0 = self.passWordTxtFld.text!
            
            self.performSegue(withIdentifier: "goto_ZeroNavController", sender: self)
        }
    }
}



extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userNameTxtFld || textField == passWordTxtFld {
            self.warningLbl.isHidden = true
        }
    }
}
