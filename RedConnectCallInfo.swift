//
//  RedConnectCallInfo.swift
//  rc
//
//  Created by Arseniy Krupenin on 11.03.16.
//  Copyright © 2016 RH. All rights reserved.


import UIKit

class RedConnectCallInfo: NSObject {
    
    var id: Int?
    var data: String?
    var time: String?
    var status: String?
    var vid: Int?
    var clientPhone: String?
    var visitorPhone: String?
    var free: Bool?
    var country: String?
    var countryRu: String?
    var city: String?
    var cityRu: String?
    var duration: String?
    var liked: Bool?

    var widgetId: Int?
    var browser: String?
    var visits: Int?
    var feedbackComment: String?
    var page: String?
    var ip: String?
    var timeOnSite: String?
    var viewedPages: Int?
    var comment: String?
    var hasFileName: Bool?
    
    var reached: Bool?
    var referrer: String?






    override init () {
        
        self.id = 0
        self.data = ""
        self.time = ""
        self.status = ""
        self.vid = 0                  //?
        self.free = false
        self.clientPhone = ""
        self.visitorPhone = ""
        self.country = ""
        self.countryRu = ""
        self.city = ""
        self.cityRu = ""
        self.duration = ""
        self.liked = false            //?
        
        
        self.widgetId = 0
        self.browser = ""
        self.visits = 1
        self.feedbackComment = ""       //?
        self.page = ""
        self.ip = ""
        self.timeOnSite = ""
        self.viewedPages = 0
        self.comment = ""
        self.hasFileName = false

        
        super.init()
        
    }
    
    
    
        init ( time: String, clientPhone: String, visitorPhone: String, free: Bool, visits: String,country: String, city: String, browser: String, status: String, duration: String ) {

        }

}
