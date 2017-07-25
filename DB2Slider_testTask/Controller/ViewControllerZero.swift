//
//  ViewControllerZero.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/24/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class ViewControllerZero: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    
    var contacts = [ContactDetailsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        initConfig()

    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "ContactDetailsCell", for: indexPath) as? ContactDetailsCell {
            
            let contact: ContactDetailsModel!
            
//            cell.configureCell(contact)
            
            return cell
            
        } else {
            return  UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contact: ContactDetailsModel!
        
        contact = contacts[indexPath.row]
        
        performSegue(withIdentifier: "goToDialogDetailsVC", sender: contact)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return CGSize(width: self.view.frame.size.width, height: 150)
    }
    
    
    
    func initConfig() {
        self.collection.dataSource = self
        self.collection.delegate = self
        
//        self.collection.
        
        self.collection.register(ContactDetailsCell.self, forCellWithReuseIdentifier: "ContactDetailsCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDialogDetailsVC" {
            
            if let detailsVC = segue.destination as? DialogDetailsVC {
                if let dialog = sender as? ContactDetailsModel {
                    detailsVC.contact = dialog
                }
            }
        }
    }
}
