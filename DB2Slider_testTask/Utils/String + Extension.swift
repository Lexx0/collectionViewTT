//
//  String + Extension.swift
//  DB2Slider_testTask
//
//  Created by Alex Berezovsky on 7/28/17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import Foundation

public func dateManipulation(time0: String) -> String {
    // this chank of code substitites irrelavant for users digits and symbols in date
    var time = time0
    time = time.replaceTodaysDate(target: time, withString: "today ")
    time = time.replaceYesterdaysDate(target: time, withString: "yesterday ")
    if let timeSecondless = time.range(of: ".")?.lowerBound {
        let qt = time.substring(to: timeSecondless)
        time = qt
    }
    time = time.replacingOccurrences(of: "T", with: " ")
    return time
}

extension String {
    
//    func replaceEmoji() -> CFMutableString {
//        if (self == ":poop:") {
//            let newString = self.replacingCharacters(in: , with: <#T##String#>)
//        }
//    }
    
    public func replaceTodaysDate(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: timeZero+"T", with: "today ", options: .regularExpression, range: nil)
    }
    
    public func replaceYesterdaysDate(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: dayBefore+"T", with: "yesterday ", options: .regularExpression, range: nil)
    }
    
    

}

