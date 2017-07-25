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
            
            return cell
            
        } else {
            return  UICollectionViewCell()
        }
    }
    
    func initConfig() {
        self.collection.dataSource = self
        self.collection.delegate = self
    }
}
