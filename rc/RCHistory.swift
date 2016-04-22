//
//  RCHistory.swift
//  rc
//
//  Created by Arseniy Krupenin on 12.03.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit

class RCHistory: NSObject {
    
    static func getCallsHistoryWithSectors() -> ([String], [[RedConnectCallData]]) {
        
        let callsHistoryArray = self.getCallsHistoryArray()
        var daysArray = [String]()
        var daysSet: Set<String> = []
        var callsHistoryWithSectors = [[RedConnectCallData]]()
        
        for call in callsHistoryArray { daysSet.insert(call.date) }
        
        daysArray = daysSet.sort(>)
        
        for i in 0 ..< daysArray.count {
            callsHistoryWithSectors.append([RedConnectCallData()])
            for call in callsHistoryArray {
                if call.date == daysArray[i] { callsHistoryWithSectors[i].append(call) }
            }
        }
        
        var formattedDaysArray = [String]()
        
        for day in daysArray {
            formattedDaysArray.append(RCDataFormat.dateFormat(day))
        }
        
        return (formattedDaysArray, callsHistoryWithSectors)
        
    }
    
    
    static func getCallsHistoryArray() -> [RedConnectCallData] {
        
        var callsHistoryArray = [RedConnectCallData]()
        
        let urlString = "http://redhelper.ru/my/api/rc/calls?sh=100&q=100&key=" + AppData.restKey
        
        let url = NSURL(string: urlString)
        let data = try? NSData(contentsOfURL: url!, options: [])
        let json = JSON(data: data!)
        
        for i in 0 ..< json.count {
            
            let call = RedConnectCallData()
            
            let callElement = json[i]

            if let id =                 callElement[""].int                     { call.id = id }
            if let widgetId =           callElement["widgetId"].int             { call.widgetId = widgetId }
            if let time =               callElement["time"].string              { call.time = time }
            if let requestTimestamp =   callElement["requestTimestamp"].string  { call.requestTimestamp = requestTimestamp }
            if let scheduled =          callElement["scheduled"].int            { call.scheduled = scheduled }
            if let clientPhone =        callElement["clientPhone"].string       { call.clientPhone = clientPhone }
            if let visitorPhone =       callElement["visitorPhone"].string      { call.visitorPhone = visitorPhone }
            if let vid =                callElement["vid"].int                  { call.vid = vid }
            if let duration =           callElement["duration"].int             { call.duration = duration }
            if let free =               callElement["free"].bool                { call.free = free }
            if let liked =              callElement["liked"].bool               { call.liked = liked }
            if let feedbackComment =    callElement["feedbackComment"].string   { call.feedbackComment = feedbackComment }
            if let page =               callElement["page"].string              { call.page = page }
            if let ip =                 callElement["ip"].string                { call.ip = ip }
            if let timeOnSite =         callElement["timeOnSite"].string        { call.timeOnSite = timeOnSite }
            if let referrer =           callElement["referrer"].string          { call.referrer = referrer }
            if let visits =             callElement["visits"].int               { call.visits = visits }
            if let viewedPages =        callElement["viewedPages"].int          { call.viewedPages = viewedPages }
            if let country =            callElement["country"].string           { call.country = country }
            if let countryRu =          callElement["countryRu"].string         { call.countryRu = countryRu }
            if let city =               callElement["city"].string              { call.city = city }
            if let cityRu =             callElement["cityRu"].string            { call.cityRu = cityRu }
            if let browser =            callElement["browser"].string           { call.browser = browser }
            if let customFields =       callElement["customFields"].string      { call.customFields = customFields }
            if let status =             callElement["status"].string            { call.status = status }
            if let comment =            callElement["comment"].string           { call.comment = comment }
            if let filename =           callElement["filename"].string          { call.filename = filename }
                
            callsHistoryArray.append(call)
        }
        
        return callsHistoryArray
    }
}

class RedConnectCallData: NSObject {
    
    var id: Int!
    var widgetId: Int!
    var time: String!
    var requestTimestamp: String!
    var scheduled: Int!
    var clientPhone:  String!
    var visitorPhone: String!
    var vid: Int!
    var duration: Int!
    var free: Bool!
    var liked: Bool!
    var feedbackComment: String!
    var page: String!
    var ip: String!
    var timeOnSite: String!
    var referrer: String!
    var visits: Int!
    var viewedPages: Int!
    var country: String!
    var countryRu: String!
    var city: String!
    var cityRu: String!
    var browser: String!
    var customFields: String!
    var status: String!
    var comment: String!
    var filename: String!
    
    var date: String {
        get {
            let dateWithTimeArray = time.componentsSeparatedByString(" ")
            return dateWithTimeArray[0]
        }
    }
    
}

