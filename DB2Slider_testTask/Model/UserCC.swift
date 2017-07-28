//
//  UserCC.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/27/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import Foundation
import ObjectMapper

class UserCC: NSObject, Mappable {
    
    var id: Int?
    var photo: String!
    var first_name: String!
    var last_name: String!
    var username: String!
    
    
    required init?(map: Map) {
        if map.JSON["id"] as? Int == nil {
            return nil
        }
        super.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        photo <- map["photo"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        username <- map["username"]
//        <- map[""]
//        last_message
        
    }
    
//    "photo": "https://placeimg.com/400/400/people",
//    "first_name": "Alex",
//    "last_name": "Clar",
//    "username": "alexclar"
}
