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
public var headerZ:  HTTPHeaders = ["Authorization": "Basic aW9zdGVzdDppb3N0ZXN0MmsxNyE="]
public var user0 = ""
public var pass0 = ""
//public var requestResponse = ""

public var timeZero = ""
public var dayBefore = ""

