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
        self.userNameTxtFld.text = ""
        self.passWordTxtFld.text = ""
        self.warningLbl.isHidden = true
        self.okBtn.setTitle("OK", for: .normal)
    }

    @IBAction func okBtnTapped(_ sender: Any) {
        
        /*let request = sessionManager.request(url, method: .put, parameters: [:], encoding: order).responseString { response in
         print("\(response)") // MARK - Problems with PUT Request
         }
         
         print("LOOK HERE \(request)")
         print("LOOK HERE \(order)")*/
//        let parameterz = [self.userNameTxtFld.text!: self.passWordTxtFld.text!]
        
        
        
//        sessionManager.request(CHANNELS_URL, method: .get, parameters: parameterz, encoding: nil, headers: nil).responseJSON { response in
//            
//            print("RESPONSE ", response)
//            
//        }
        
//        let url = URL(string: "CHANNELS_URL")!
//        var urlRequest = URLRequest(url: url)
        
        let parameters: Parameters = [self.userNameTxtFld.text!: self.passWordTxtFld.text!]
        
        sessionManager.request(CHANNELS_URL, method: HTTPMethod.get, parameters: parameters).responseJSON { response in
            
            print("response", response)
            
            if (response.result.isSuccess == true) {
                self.performSegue(withIdentifier: "goto_ZeroNavController", sender: self)
            }
            
//            guard let responseValue = response.result.value as? AnyObject, let chatArray = responseValue["channels"] as? [String: Any] else { return }
//            
//            channels = []
//            
//            for chat in chatArray {
//                
//                UsersAndMessages(JSON: chat).map {
//                    channels.append($0)
//                }
////                UsersAndMessages(map: chat).map {
////                    channels.append($0)
//            }
        }
        
    }
}
