//
//  ViewControllerZero.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/24/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit
//import Alamofire
import ObjectMapper

class ViewControllerZero: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var contacts = [ContactDetailsModel]()
    var channels = [UsersAndMessages]()

    var swipeLeftGestureRecognizer = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initConfig()
        
        parseDialogs()

    }

    
    
    
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
            print("request000 ", CHANNELS_URL,"111", response)
            
            guard (response.result.isSuccess == true) else { print("OI"); return}
            
            guard let json = response.result.value as? [String : Any] else { return }
            
            print("json", json)
            UsersAndMessages(JSON: json).map {
                self.channels.append($0)
            }
            print("111", self.channels.count, self.channels)
//

            
        }
        
        self.collection.reloadData()
    }
    
    func deleteItemAtIndex(sender: UISwipeGestureRecognizer) {
        
        print("swipe")
        let indexPath0 = NSIndexPath()
        let location0 = sender.location(in: collectionView(self.collection, cellForItemAt: indexPath0 as IndexPath))
//        let index = location0.row
//
//        print("index", indexPath0, "location")
//        
//        self.contacts.remove(at: location0)
//        self.collection.reloadData()
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
