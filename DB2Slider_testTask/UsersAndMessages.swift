//
//  UsersAndMessages.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/27/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import Foundation
import ObjectMapper

class UsersAndMessages: NSObject, Mappable {
    
    var id:Int?
    var userCC: [UserCC] = []
    var lastMessageCC: LastMessageCC
    var unread_messages_count: Int = 0
    
    required init?(map: Map) {
        if map.JSON["id"] as? Int == nil {
            return nil
        }
        super.init()
    }
//    required init(map: Map)
    
    func mapping(map: Map) {
        id <- map["id"]
        userCC <- map["users"]
        lastMessageCC <- map["lastMessageCC"]
        unread_messages_count <- map["unread_messages_count"]
        
    }
}
