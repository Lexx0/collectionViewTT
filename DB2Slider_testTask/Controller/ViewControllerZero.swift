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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initConfig() {
        self.collection.dataSource = self
        self.collection.delegate = self
    }
}
