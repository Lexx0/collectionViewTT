//
//  lastMessageCC.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/27/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import Foundation
import ObjectMapper

class lastMessageCC: NSObject, Mappable {
    
    var text: String!
    var sender: UserCC
    var create_date: String!
    var is_read: Bool
    
    required init?(map: Map) {
        if map.JSON["text"] as? String == nil {
            return nil
        }
//        super.init()
        super.init!()
    }
    
    func mapping(map: Map) {
        text <- map["text"]
        sender <- map["sender"]
        create_date <- map["create_date"]
        is_read <- map["is_read"]
        
//        <- map[""]
    }
}
