//
//  DialogDetailsVC.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/25/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class DialogDetailsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    public var contact: ContactDetailsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initConfig()
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "DialogCell", for: indexPath) as? DialogCell {
            
            let cellData = contact
            
            cell.messageFromContact.text = cellData!.longDialog[indexPath.row]
            cell.userPic.image = UIImage(named: cellData!.profilePicture)
            
//            if indexPath.row != cellData!.longDialog.count-1 {
//                cell.userPic.isHidden = true
//            } else {
//                cell.userPic.isHidden = false
//            }
            
            return cell
        } else {
            return DialogCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.contact.longDialog.count
    }
    
    
//    @IBAction func backBtnTapped(_ sender: Any) {
//        
//        print("тиц")
////        self.navigationController!.popViewController(animated: true)
//        navigationController?.popViewController(animated: true)
//    }

    func initConfig() {
        self.collection.dataSource = self
        self.collection.delegate = self
        
        print("покемон", contact.name)
        
        self.title = self.contact.name
//        self.titleLabel.text = contact.name
        
    }
}
