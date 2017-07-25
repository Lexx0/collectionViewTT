//
//  ContactDetailsModel.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/24/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import Foundation

class ContactDetailsModel {
    
    var profilePicture: String!
    var name: String!
    var message: String!
    var badgeInt: String!
    var date: String!
    
    var faceID: Int!
    var faceURL: String!
    
    
    init(profilePicture: String, name: String, message: String, badgeInt: String, date: String) {
        self.profilePicture = profilePicture
        self.name = name
        self.message = message
        self.badgeInt = badgeInt
        self.date = date
        
        self.faceURL = "\(URL_BASE_FOR_FACE_IMAGE)\(URL_POKERMON)\(self.faceID)"
    }
    
}
