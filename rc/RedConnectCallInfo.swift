//
//  RedConnectCall.swift
//  rc
//
//  Created by Arseniy Krupenin on 09.03.16.
//  Copyright © 2016 cute.ru.com. All rights reserved.
//

import UIKit

class RedConnectCallInfo {

    var time: String
    var clientPhone: String
    var visitorPhone: String
    var free: Bool
    var visits: String
    var country: String
    var city: String
    var browser: String
    var status: String
    var duration: String
    
        init () {
    
            self.time = ""
            self.clientPhone = ""
            self.visitorPhone = ""
            self.free  = true
            self.visits  = ""
            self.country  = ""
            self.city  = ""
            self.browser  = ""
            self.status  = ""
            self.duration  = ""
    
        }
    
    
    
//    init ( time: String, clientPhone: String, visitorPhone: String, free: Bool, visits: String,country: String, city: String, browser: String, status: String, duration: String ) {
//        
//        self.time = time
//        self.clientPhone = clientPhone
//        self.visitorPhone = visitorPhone
//        self.free = free
//        self.visits = visits
//        self.country = country
//        self.city = city
//        self.browser = browser
//        self.visitor_unavailable = visitor_unavailable
//        self.duration = duration
//
//    }

}