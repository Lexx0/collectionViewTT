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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
