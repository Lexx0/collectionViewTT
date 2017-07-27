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
    var userCC: UserCC
    
    required init?(map: Map) {
        if map.JSON["id"] as? Int == nil {
            return nil
        }
        super.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userCC <- map["users"]
        
    }
}
