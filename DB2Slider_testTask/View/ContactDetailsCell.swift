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
    
    var cell0: ContactDetailsModel!
    
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
    }

    
    
    func configureCell(_ cell: ContactDetailsModel) {
        self.cell0 = cell

        nameLbl.text = self.cell0.name.capitalized
        messageLbl.text = self.cell0.shortMessage
        dateLbl.text = self.cell0.date
        userPicImg.image = UIImage(named: self.cell0.profilePicture)
        badgeIntBtn.setTitle(self.cell0.badgeInt, for: .normal)
        
        badgeIntBtn.layer.cornerRadius = 15.0
        badgeIntBtn.layer.masksToBounds = true
        badgeIntBtn.backgroundColor = .blue
        
        userPicImg.layer.cornerRadius = 21.0
        userPicImg.layer.masksToBounds = true
        
        if self.cell0.badgeInt == "0" {
            badgeIntBtn.isHidden = true
        } else {
            badgeIntBtn.isHidden = false
        }
        
    }

}
