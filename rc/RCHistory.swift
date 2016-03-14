//
//  RCHistory.swift
//  rc
//
//  Created by Arseniy Krupenin on 12.03.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit

class RCHistory: NSObject {

    static func getHistory() -> [RedConnectCallInfo] {
        
        var callsHistoryArray = [RedConnectCallInfo]()
        
        let file = NSBundle.mainBundle().pathForResource("calls", ofType: "json") as String!
        let data = NSData(contentsOfFile: file) as NSData!
        let json = JSON(data: data, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        for i in 0 ..< json.count {
            for j in 0 ..< json[i].count {
                let call = RedConnectCallInfo()
                
                if let time = json[i]["value"][j]["time"].string { call.time = time }
                if let visitorPhone = json[i]["value"][j]["visitorPhone"].string {
                    call.visitorPhone = visitorPhone
                }
                
                if let clientPhone = json[i]["value"][j]["clientPhone"].string {
                    call.clientPhone = clientPhone
                }
                
                if let city = json[i]["value"][j]["city"].string {
                    call.city = city
                }
                
                if let liked = json[i]["value"][j]["liked"].string {
                    if liked == "true" { call.liked = true }
                    else if liked == "false" { call.liked = false }
                }
                
                if let free = json[i]["value"][j]["free"].bool {
                    if free { call.free = true }
                    else if !free { call.free = false }
                }
                
                callsHistoryArray.append(call)
            }
        }
        
        return callsHistoryArray
    }
    
    
}
