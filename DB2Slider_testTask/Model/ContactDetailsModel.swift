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
    var shortMessage: String!
    var longDialog: [String]!
    var badgeInt: String!
    var date: String!
    
//    var faceID: Int!
//    var faceURL: String!
    
    
    init(profilePicture: String, name: String, shortMessage: String, badgeInt: String, date: String, longDialog: [String]/*, faceID: Int*/) {
        self.profilePicture = profilePicture
        self.name = name
        self.shortMessage = shortMessage
        self.badgeInt = badgeInt
        self.date = date
        self.longDialog = longDialog
//        self.faceID = faceID
        
//        self.faceURL = "\(URL_BASE_FOR_FACE_IMAGE)\(URL_POKERMON)\(self.faceID)"
    }
}
