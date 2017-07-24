//
//  ContactDetailCell.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/24/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class ContactDetailCell: UITableViewCell {

    
    @IBOutlet weak var userPicImageView: UIImageView!
    
    @IBOutlet weak var contactNameLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var countBadgeBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
}
