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
    
    static func timeFormat (dateWithTime: String) -> String {
        let dateWithTimeArray = dateWithTime.componentsSeparatedByString(" ")
        let timeArray = dateWithTimeArray[1].componentsSeparatedByString(":")
        let time = timeArray[0] + ":" + timeArray[1]
        return time
    }
    
//    Для нашего современного календаря:
//    
//    W = d + [ (13m - 1) / 5 ] + y + [ y / 4 ] + [ c / 4 ] - 2c
//    
//    где d - число месяца;
//    m - номер месяца, начиная с марта (март=1, апрель=2, ..февраль=12);
//    y - номер года в столетии (например, для 1965 года y=65. Для января и февраля 1965 года, т. е. для m=11 или m=12 номер года надо брать предыдущий, т. е. y=64);
//    c - количество столетий (например, для 2000 года c=20. И здесь для января и февраля 2000 года надо брать предыдущее столетие с=19);
//    квадратные скобки означают целую часть полученного числа (отбрасываем дробную) .
//    
//    Результат W делите на 7 и модуль остатка от деления даст день недели (воскресенье=0, понедельник=1, ..суббота=6)
//    
//    Пример: для 31 декабря 2008 года определяем:
//    d=31, m=10, y=8, c=20
//    
//    По формуле находим:
//    W = 31 + [ ( 13 * 10 - 1 ) / 5 ] + 8 + [ 8 / 4 ] + [ 20 / 4 ] - 2 * 20 =
//    = 31 + 25 + 8 + 2 + 5 - 40 = 31
//    
//    Теперь делим W на 7 и находим остаток от деления: 31 / 7 = 4 и 3 в остатке.
//    Тройка соответствует дню недели СРЕДА.
    
}
