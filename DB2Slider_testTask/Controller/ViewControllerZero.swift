//
//  ViewControllerZero.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/24/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class ViewControllerZero: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
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
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}
