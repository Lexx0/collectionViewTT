//
//  Constants.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/25/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public let CHANNELS_URL = "https://iostest.db2dev.com/api/chat/channels/"
public let MESSAGES_URL = "https://iostest.db2dev.com/api/chat/channels/1/messages/"

public var sessionManager = Alamofire.SessionManager()

public let names = ["Rick Sanchez", "Morty", "Scorpion", "Pickachoo"]

public let dialogs = ["donth think about it", "um, rick... This is bad idea", "Get over here", "Pika pika pikachoo"]

public let badgeCounts = ["1", "0", "0", "0"]

public let dates = ["tomorrow 6:01", "yesterday 10:00", "Feb,10 20:10", "April, 6 10:21"]

public let dialogChain = [
    ["Sometimes science is more art than science, Morty. Lot of people don't get that. ", "donth think about it", "Wubba-lubba-dub-dub!", "And that's the waaaaay the news goes! ", "I'm just trying to make a conversation"],
    ["Nobody exists on purpose. Nobody belongs anywhere. Everybody's gonna die. Come watch T.V.", "um, rick...", "This is bad idea", "Rick?.."],
    ["Your soul is mine", "Get over here"],
    ["Pika", "pika", "pikachoo", "pikachoo","pikachoo"]]
