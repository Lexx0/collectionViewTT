//
//  String + Extension.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/28/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import Foundation

extension String {
    
//    func replaceEmoji() -> CFMutableString {
//        if (self == ":poop:") {
//            let newString = self.replacingCharacters(in: , with: <#T##String#>)
//        }
//    }
    
    func replaceTodaysDate(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: timeZero+"T", with: "today ", options: .regularExpression, range: nil)
    }
    
    func replaceYesterdaysDate(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: dayBefore+"T", with: "yesterday ", options: .regularExpression, range: nil)
    }

}

