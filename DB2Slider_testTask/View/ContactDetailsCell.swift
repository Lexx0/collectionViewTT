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
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
//        super.init(frame: )
//        let size0 = CGSize(width: super.self.view.frame.size.width, height: 100)
//        super.init(frame: size0, collectionViewLayout, layout: UICollectionViewLayout)
//        layer.cornerRadius = 5.0
        
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//    }

    
//    required init?(coder aCoder: NSCoder) {
//        super.init(coder: aCoder)
//        
////        layer.cornerRadius = 5.0
//        
//    }
    
    func configureCell(_ cell: ContactDetailsModel) {
        self.cell0 = cell

        nameLbl.text = self.cell0.name.capitalized
        messageLbl.text = self.cell0.shortMessage
        dateLbl.text = self.cell0.date
        userPicImg.image = UIImage(named: self.cell0.profilePicture)
        badgeIntBtn.setTitle(self.cell0.badgeInt, for: .normal)
        

//        userPicImg.image = UIImage(named: "\(self.cell0.faceID)")
    }

}
