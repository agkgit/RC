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
        
        if number.characters.count == 11 {
            for char in number.characters {
                phone.append(char)
                if (i == 3) { phone.append(bktClose) }
                if (i == 0) || (i == 3) { phone.append(space) }
                if (i == 0) { phone.append(bktOpen) }
                if (i == 6) || (i == 8) { phone.append(dash)}
                i += 1
            }
        } else if number.characters.count == 12 {
            for char in number.characters {
                phone.append(char)
                if (i == 4) { phone.append(bktClose) }
                if (i == 1) || (i == 4) { phone.append(space) }
                if (i == 1) { phone.append(bktOpen) }
                if (i == 7) || (i == 9) { phone.append(dash)}
                i += 1
            }
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
            
        default: break
            
        }
        
        var d = 0
        if let day = Int(dayOfMonthArray[2]) { d = day }
        
        var m = 0
        if let day = Int(dayOfMonthArray[1]) {
            
            switch day {
            case 1      : m = 11
            case 2      : m = 12
            case 3...12 : m = Int(day) - 2
            default: break
            }
        }
        
        var c = 0, y = 0
        if let year = Int(dayOfMonthArray[0]) {
            c = year / 100
            y = year % 100
        }
        
        let weekdayNum = (d + ( ((13 * m) - 1) / 5 ) + y + ( y / 4 ) + ( c / 4 ) - (2 * c)) % 7
        var weekday = ""
        
        switch weekdayNum {
        case 0: weekday = "Воскресенье"
        case 1: weekday = "Понедельник"
        case 2: weekday = "Вторник"
        case 3: weekday = "Среда"
        case 4: weekday = "Четверг"
        case 5: weekday = "Пятница"
        case 6: weekday = "Суббота"
        default:
            break
        }
        
        
        let dayOfMonthString = weekday + ", " + dayOfMonthArray[2] + " " + month + " " + dayOfMonthArray[0]
        
        return dayOfMonthString
    }
    
    static func timeFormat (dateWithTime: String) -> String {
        let dateWithTimeArray = dateWithTime.componentsSeparatedByString(" ")
        let timeArray = dateWithTimeArray[1].componentsSeparatedByString(":")
        let time = timeArray[0] + ":" + timeArray[1]
        return time
    }
    
    static func replaceChar (str: String, replace: Character, replaced: Character) -> String {
        var str1 = ""
        for Character in str.characters {
            var i = Character
            if i == replace {
                i = replaced
            }
            str1.append(i)
        }
        
        return str1
    }

    
    func dayOfWeek(date: String) -> String {
        let dateWithTimeArray = date.componentsSeparatedByString(" ")
        let dayOfMonthArray = dateWithTimeArray[0].componentsSeparatedByString("-")
        
        var d = 0
        if let day = Int(dayOfMonthArray[2]) { d = day }
        
        var m = 0
        if let day = Int(dayOfMonthArray[1]) {
            
            switch day {
            case 1      : m = 11
            case 2      : m = 12
            case 3...12 : m = Int(day) - 2
            default: break
            }
        }
    
        var c = 0, y = 0
        if let year = Int(dayOfMonthArray[0]) {
            c = year / 100
            y = year % 100
        }
        
        let weekdayNum = (d + ( ((13 * m) - 1) / 5 ) + y + ( y / 4 ) + ( c / 4 ) - (2 * c)) % 7
        var weekday = ""
        
        switch weekdayNum {
        case 0: weekday = "Воскресенье"
        case 1: weekday = "Понедельник"
        case 2: weekday = "Вторник"
        case 3: weekday = "Среда"
        case 4: weekday = "Четверг"
        case 5: weekday = "Пятница"
        case 6: weekday = "Суббота"
        default:
            break
        }
        
        return weekday
    }    
}
