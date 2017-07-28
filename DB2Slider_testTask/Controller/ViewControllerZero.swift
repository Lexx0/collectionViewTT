//
//  ViewControllerZero.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/24/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit
import Alamofire
//import ObjectMapper

class ViewControllerZero: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var contacts = [ContactDetailsModel]()
    var channels = [UsersAndMessages]()

    var swipeLeftGestureRecognizer = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initConfig()
        
        parseDialogs()

    }

    
    func initConfig() {

        self.collection.dataSource = self
        self.collection.delegate = self
        
        self.title = "Chats"

//        self.swipeLeftGestureRecognizer.direction = .left
//        self.swipeLeftGestureRecognizer.numberOfTouchesRequired = 1
//        self.swipeLeftGestureRecognizer.addTarget(self.collection.collectionViewLayout, action: #selector(self.deleteItemAtIndex(sender:)))

    }
    
    func parseDialogs() {
        
        sessionManager.request(CHANNELS_URL).authenticate(user: user0, password: pass0).responseJSON { response in
//            print("request000 ", CHANNELS_URL,"111", response)
            
            guard (response.result.isSuccess == true) else { print("OI"); return}
            guard let responseZ = response.result.value as? [String: AnyObject], let rawDicts = responseZ["channels"] as? [Any] else {print("OI 2"); return }
            
            print("ZZZ 000", rawDicts[0])
//            print("ОГО ", responseZ)
//            print("_POI", responseZ["channels"]) //ОТСЮДА ФІГНЯ
            
//            if let array0 = responseZ["channels"] as? [[Any]] {
//                print("_json0", array0[0])
//            } else if let array1 = responseZ["channels"] as? [Any] {
//                print("ZZZ1", array1[0])
//            } else if let array2 = responseZ["channels"] as? ([String: Any]) {
//                print("ZZZ2", array2)
//            } else if let array3 = responseZ["channels"] as? [AnyObject] {
//                print("ZZZ3", array3)
//            } else if let array4 = responseZ["channels"] as? NSArray {
//                print("ZZZ4", array4)
//            }
//
//            print("ЮЛЯ 1111", responseZ["channels"]) //responseZ["chanels"]
            
//            guard let array0 = responseZ["chanels"] as? [[Any]] else {print("OI Z0"); return} //[[String: Any]]
////            print("_json0", array0[0])
//            
//            guard let array1 = responseZ["chanels"] as? [Any] else {print("OI Z1")}
////            print("_json1", array1[0])
//            
//            guard let array2 = responseZ["chanels"] as? ([String: Any]) else {print("OI Z2"); return}
//            print("_json2", array2[0])
//            print(<#T##items: Any...##Any#>)
            
//            let taskArray = array0.flatMap { $0["task_id"] as? String }
//            print(taskArray)
            
//            for json in jsons {
//                print("_QWE000 ", json)
////                UsersAndMessages(JSON: json).map {
////                    self.channels.append($0)
////                }
//            }
            
//            print("111", self.channels.count, self.channels)
        }
        
        self.collection.reloadData()
    }
    
    func deleteItemAtIndex(sender: UISwipeGestureRecognizer) {
        
        print("swipe")
        let indexPath0 = NSIndexPath()
        let location0 = sender.location(in: collectionView(self.collection, cellForItemAt: indexPath0 as IndexPath))
    }
    
    func nextBtnTapped(sender: AnyObject) {
        
        let indexPathRow = sender.view.tag
        
        let contact: ContactDetailsModel!
        contact = contacts[indexPathRow]
        
        performSegue(withIdentifier: "goToDialogDetailsVC", sender: contact)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDialogDetailsVC" {
            
            if let detailsVC = segue.destination as? DialogDetailsVC {
                if let dialog = sender as? ContactDetailsModel {
                    detailsVC.contact = dialog
                    
                    print("имя будет ", dialog.name)
                }
            }
        }
    }
}







extension ViewControllerZero: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "ContactDetailsCell", for: indexPath) as? ContactDetailsCell {
            
            let contactData: ContactDetailsModel! = self.contacts[indexPath.row]
            
            cell.configureCell(contactData)
            
            cell.nextBtn.tag = indexPath.row
            
            //            cell.nextBtn.addTarget(self, action: Selector("nextBtnTapped:"), for: .touchUpInside)
            let nextSelector: Selector = #selector(ViewControllerZero.nextBtnTapped)
            let nextSelectorGesture = UITapGestureRecognizer(target: self, action: nextSelector)
            nextSelectorGesture.numberOfTapsRequired = 1
            cell.nextBtn?.addGestureRecognizer(nextSelectorGesture)
            
            //            self.swipeLeftGestureRecognizer.direction = .left
            //            self.swipeLeftGestureRecognizer.numberOfTouchesRequired = 1
            //            self.swipeLeftGestureRecognizer.addTarget(cell, action: #selector(self.deleteItemAtIndex(sender:)))
            
            return cell
            
        } else {
            return  UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //        let contact: ContactDetailsModel!
        //        contact = contacts[indexPath.row]
        //
        //        performSegue(withIdentifier: "goToDialogDetailsVC", sender: contact)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 100)
    }
}
