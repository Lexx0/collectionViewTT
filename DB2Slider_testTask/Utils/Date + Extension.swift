//
//  Date + Extension.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/28/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import Foundation


extension Date {

    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
}
