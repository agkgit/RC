//
//  RCDataFormat.swift
//  rc
//
//  Created by Admin on 12.04.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit

class RCDataFormat: NSObject {
    
    static func phoneNumberFormat (number: String) -> String {
        
        var phone: String = "+"
        var i = 0
        let space: Character = " "
        let bktOpen: Character = "("
        let bktClose: Character = ")"
        let dash: Character = "-"
        
        for char in number.characters {
            phone.append(char)
            if (i == 3) { phone.append(bktClose) }
            if (i == 0) || (i == 3) { phone.append(space) }
            if (i == 0) { phone.append(bktOpen) }
            if (i == 6) || (i == 8) { phone.append(dash)}
            i += 1
        }
        
        return phone
    }
    
    static func dateFormat (dateWithTime: String) -> String {
        
        let dateWithTimeArray = dateWithTime.componentsSeparatedByString(" ")
        let dayOfMonthArray = dateWithTimeArray[0].componentsSeparatedByString("-")
        var month = ""
        
        switch dayOfMonthArray[1] {
        case "01": month = "января"
        case "02": month = "февраля"
        case "03": month = "марта"
        case "04": month = "апреля"
        case "05": month = "мая"
        case "06": month = "июня"
        case "07": month = "июля"
        case "08": month = "августа"
        case "09": month = "сентября"
        case "10": month = "октября"
        case "11": month = "ноября"
        case "12": month = "декабря"
        default:
            print("error")
        }
        
        let dayOfMonthString = dayOfMonthArray[2] + " " + month + " " + dayOfMonthArray[0]
        
        return dayOfMonthString
        
    }
    
}
