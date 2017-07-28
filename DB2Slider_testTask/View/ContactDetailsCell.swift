//
//  ContactDetailsCell.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/24/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class ContactDetailsCell: UICollectionViewCell {

    
    @IBOutlet weak var userPicImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var badgeIntBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var cell0: UsersAndMessages!
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
    }

    func configureCell(_ cell: UsersAndMessages) {
        self.cell0 = cell

//        let URLSTRING = cell0.userCC[0].photo as! URL
//        
//        let task = URLSession.shared.dataTask(with: URLSTRING) { data, response, error in
//            guard let data = data, error == nil else { return }
//            
//            DispatchQueue.main.sync() {
//                self.userPicImg.image = UIImage(data: data)
//            }
//        }
//        task.resume()
        
        userPicImg.image = UIImage(contentsOfFile: cell0.userCC[0].photo)
        nameLbl.text = cell0.userCC[0].first_name!+" "+cell0.userCC[0].last_name!+" "+cell0.userCC[0].username!
        messageLbl.text = cell0.lastMessageCC?.text
        dateLbl.text = cell0.lastMessageCC?.create_date
        
        if cell0.unread_messages_count == 0 {
            self.badgeIntBtn.isHidden = true
        } else if cell0.unread_messages_count != 0 {
            self.badgeIntBtn.isHidden = false
            self.badgeIntBtn.setTitle(String(describing: cell0.unread_messages_count),for: .normal)
        }
//        nameLbl.text = self.cell0.name.capitalized
//        messageLbl.text = self.cell0.shortMessage
//        dateLbl.text = self.cell0.date
//        userPicImg.image = UIImage(named: self.cell0.profilePicture)
//        badgeIntBtn.setTitle(self.cell0.badgeInt, for: .normal)
        
//        if cell0.lastMessage.is_read == true {
//            self.badgeIntBtn.isHidden = true
//        } else if cell0.lastMessage.is_read == false {
//            self.badgeIntBtn.isHidden = false
//        }
        
        
        badgeIntBtn.layer.cornerRadius = 15.0
        badgeIntBtn.layer.masksToBounds = true
        badgeIntBtn.backgroundColor = .blue
        
        userPicImg.layer.cornerRadius = 21.0
        userPicImg.layer.masksToBounds = true
        
//        if self.cell0.badgeInt == "0" {
//            badgeIntBtn.isHidden = true
//        } else {
//            badgeIntBtn.isHidden = false
//        }
        
    }

}
