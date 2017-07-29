//
//  DialogDetailsVC.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/25/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class DialogDetailsVC: UIViewController {

    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var entryTxtFld: UITextField!
    
    public var contact: UsersAndMessages!
    
    var messagesInExplicitDialog = [MessageED]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initConfig()
        
        self.parseDialog()
    }

    
    func initConfig() {
        
        print("My name is ", contact.userCC[1].username)
        
        self.collection.dataSource = self
        self.collection.delegate = self
        
        self.title = self.contact.userCC[0].username!
    }
    
    func parseDialog() {
        
        sessionManager.request(MESSAGES_URL).authenticate(user: user0, password: pass0).responseJSON { response in
            
//            print("_DIAL ", response)
            guard (response.result.isSuccess == true) else { print("OI"); return}
            
            guard let responseZ = response.result.value as? [String: AnyObject], let rawDicts = responseZ["messages"] as? [[String: Any]] else {print("OI responseZ"); return}
                
            self.messagesInExplicitDialog = []
            
            let checkName = self.contact.userCC[0].username!
            let myName = self.contact.userCC[1].username!
            
            for dict in rawDicts {
                
                guard let senderT = dict["sender"] as? [String: Any], let nameT = senderT["username"] as? String else {return}
                
                if (nameT == checkName) || (nameT == myName)  {
                    
                    MessageED(JSON: dict).map({
                        
                        self.messagesInExplicitDialog.append($0)
                    })
                } else {
                    print("senderT", senderT)
                }
            }
            
            DispatchQueue.main.async {
                self.collection.reloadData()
            }
        }
    }
    
}








extension DialogDetailsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "DialogCell", for: indexPath) as? DialogCell {
            
            let cellData = self.messagesInExplicitDialog[indexPath.row]
            
//            var rawData = Data()
            
            let sender0 = cellData.sender?.username
            let myName = self.contact.userCC[1].username!
            
            cell.messageFrimMe.layer.cornerRadius = 7.0
            cell.messageFrimMe.layer.masksToBounds = true
            cell.messageFromContact.layer.cornerRadius = 7.0
            cell.messageFromContact.layer.masksToBounds = true
            
            if (cellData.is_read == false) {
                cell.messageFromContact.backgroundColor = .blue
            } else {
                cell.messageFromContact.backgroundColor = .gray
            }
            cell.messageFrimMe.backgroundColor = .gray
            
            let time = dateManipulation(time0: cellData.create_date!)
            
            if (sender0 == myName) {
                
                cell.messageFrimMe.isHidden = false
                cell.messageFromMeTime.isHidden = false
                cell.messageFrimMe.text = cellData.text
//                cell.messageFromMeTime.text = cellData.create_date
                cell.messageFromMeTime.text = time
                
                
                cell.messageFromContact.isHidden = true
                cell.messageTimeFromContact.isHidden = true
                cell.userPic.isHidden = true
            
                
            } else if (sender0 != myName) {
//                downloadPic(url0: (cellData.sender?.photo)!, &rawData)
                print("ccskm__ ", cellData.sender!.photo)
                
                cell.messageFrimMe.isHidden = true
                cell.messageFromMeTime.isHidden = true
                
                cell.messageFromContact.isHidden = false
                cell.messageTimeFromContact.isHidden = false
                cell.messageFromContact.text = cellData.text
//                cell.messageTimeFromContact.text = cellData.create_date
                cell.messageTimeFromContact.text = time
                
                cell.userPic.isHidden = false
//                cell.userPic.image = UIImage(data: rawData)
            }

            return cell
            
        } else {
            return DialogCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.messagesInExplicitDialog.count
    }
}
