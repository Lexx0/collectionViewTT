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
    var messages = [LastMessageCC]()

    var swipeLeftGestureRecognizer = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initConfig()
        
        parseDialogs()

    }

    override func viewDidAppear(_ animated: Bool) {
        self.collection.reloadData()
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
            
            guard (response.result.isSuccess == true) else { print("OI"); return}
            guard let responseZ = response.result.value as? [String: AnyObject], let rawDicts = responseZ["channels"] as? [[String: Any]] else {print("OI 2"); return }
            
            self.channels.removeAll()
            
            for dict in rawDicts {
                UsersAndMessages(JSON: dict).map({
                    self.channels.append($0)
                })
            }
        }
        
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
    
    func deleteItemAtIndex(sender: UISwipeGestureRecognizer) {
        
        print("swipe")
        let indexPath0 = NSIndexPath()
        let location0 = sender.location(in: collectionView(self.collection, cellForItemAt: indexPath0 as IndexPath))
    }
    
    func nextBtnTapped(sender: AnyObject) {
        
        let indexPathRow = sender.view.tag
        
        let contact: UsersAndMessages!
        contact = channels[indexPathRow]
        
        performSegue(withIdentifier: "goToDialogDetailsVC", sender: contact)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDialogDetailsVC" {
            
            if let detailsVC = segue.destination as? DialogDetailsVC {
                if let dialog = sender as? UsersAndMessages {
                    detailsVC.contact = dialog
                    
//                    print("имя будет ", dialog.name)
                }
            }
        }
    }
}







extension ViewControllerZero: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "ContactDetailsCell", for: indexPath) as? ContactDetailsCell {
            
            let contactData: UsersAndMessages! = self.channels[indexPath.row]
            
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
        
//        let cell = self.channels[indexPath.row]
//        
//        print("тыц ", indexPath.row, "MSG ", cell.lastMessageCC?.text)
        
        //        let contact: ContactDetailsModel!
        //        contact = contacts[indexPath.row]
        //
        //        performSegue(withIdentifier: "goToDialogDetailsVC", sender: contact)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("СКОЛЬКО ТУТ ??? ", self.channels.count)
        return channels.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 100)
    }
}
