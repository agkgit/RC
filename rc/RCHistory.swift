//
//  RCHistory.swift
//  rc
//
//  Created by Arseniy Krupenin on 12.03.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit

class RCHistory: NSObject {

    
    static func getSectors() -> [String] {
        let file = NSBundle.mainBundle().pathForResource("calls", ofType: "json") as String!
        let data = NSData(contentsOfFile: file) as NSData!
        let json = JSON(data: data, options: NSJSONReadingOptions.MutableContainers, error: nil)
        var days = [String]()
        
        for i in 0 ..< json.count {
            days.append(json[i]["key"].string!)
        }
        
        return days
        
    }
    
    
    static func getHistory() -> [RedConnectCallInfo] {
        
        var callsHistoryArray = [RedConnectCallInfo]()
        
        let file = NSBundle.mainBundle().pathForResource("calls", ofType: "json") as String!
        let data = NSData(contentsOfFile: file) as NSData!
        let json = JSON(data: data, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        print("json.count = \(json.count)")
        
        for i in 0 ..< json.count {
            
            
            for j in 0 ..< json[i]["value"].count {
                let call = RedConnectCallInfo()
                
                if let id = json[i]["value"][j]["id"].int { call.id = id }
                
                if let data = json[i]["key"].string { call.data = data }
                
                if let time = json[i]["value"][j]["time"].string { call.time = time }
                
                if let status = json[i]["value"][j]["status"].string { call.status = status }
                
                if let vid = json[i]["value"][j]["vid"].int { call.vid = vid }
                
                if let clientPhone = json[i]["value"][j]["clientPhone"].string {
                    call.clientPhone = clientPhone
                }
                
                if let visitorPhone = json[i]["value"][j]["visitorPhone"].string {
                    call.visitorPhone = visitorPhone
                }
                
                if let free = json[i]["value"][j]["free"].bool { call.free = free }
                
                if let country = json[i]["value"][j]["country"].string { call.country = country }
                
                if let countryRu = json[i]["value"][j]["countryRu"].string { call.countryRu = countryRu }

                if let city = json[i]["value"][j]["city"].string { call.city = city }
                
                if let cityRu = json[i]["value"][j]["cityRu"].string { call.cityRu = cityRu }
                
                if let duration = json[i]["value"][j]["duration"].string { call.duration = duration }

                if let liked = json[i]["value"][j]["liked"].bool { call.liked = liked }

                if let widgetId = json[i]["value"][j]["widgetId"].int { call.widgetId = widgetId }
                
                if let browser = json[i]["value"][j]["browser"].string { call.browser = browser }
                
                if let visits = json[i]["value"][j]["visits"].int { call.visits = visits }
                
                if let feedbackComment = json[i]["value"][j]["feedbackComment"].string {
                    call.feedbackComment = feedbackComment
                }
                
                if let page = json[i]["value"][j]["page"].string { call.page = page }
                
                if let ip = json[i]["value"][j]["ip"].string { call.ip = ip }
                
                if let timeOnSite = json[i]["value"][j]["timeOnSite"].string { call.timeOnSite = timeOnSite }
                
                if let viewedPages = json[i]["value"][j]["viewedPages"].int { call.viewedPages = viewedPages }
                
                if let comment = json[i]["value"][j]["comment"].string { call.comment = comment }
                
                if let hasFileName = json[i]["value"][j]["hasFileName"].bool { call.hasFileName = hasFileName }

                
                
                
                callsHistoryArray.append(call)
            }
        }
        
        return callsHistoryArray
    }
    
    
}
