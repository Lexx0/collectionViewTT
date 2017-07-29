//
//  ViewControllerZero.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/24/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit
import Alamofire

class ViewControllerZero: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
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
            
            let URL0 = URL(fileURLWithPath: contactData.userCC[0].photo)
            downloadImage(url: URL0, userPic: cell.userPicImg)
//            let url0 = contactData.userCC[0].photo
//            let url0 = URL(fileURLWithPath: contactData.userCC[0].photo)
//            var imageData = NSData(contentsOf: url0)
//            let url0 = URL(fileURLWithPath: contactData.userCC[0].photo)
//            print(url0)
//            let imageData = Data(
//            var imageData: NSData = NSData(contentsOfURL: url0!, options: NSData.ReadingOptions.DataReadingMappedIfSafe, error: nil)!
//            cell.userPicImg.image = UIImage(data: imageData as! Data)
            
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return channels.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: 100)
    }
    
    func downloadImage(url: URL, userPic: UIImageView) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                userPic.image = UIImage(data: data)
            }
        }
    }
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}
