//
//  Book.swift
//  DriftReading
//
//  Created by Ming Gong on 7/24/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class Book: NSObject {
    var id: String!
    var name: String!
    var author: String?
    var summary: String!
    var status: String!
    var imageUrl: String?
    var address: Address?
    var owner: User?
    var holder: User?
    var events: [Event]?
    
    init(json: [String: AnyObject]) {
        self.id = json["id"] as! String
        self.name = json["name"] as! String
        self.author = json["author"] as? String
        self.summary = json["summary"] as! String
        self.status = json["summary"] as! String
        self.imageUrl = json["image"] as? String
        if let addressJson = json["address"] {
            self.address = Address(json: addressJson as! [String: AnyObject])
        }
        if let holderJson = json["holder"] {
            self.holder = User(json: holderJson as! [String: AnyObject])
        }
        
        if let ownerJson = json["owner"] {
            self.owner = User(json: ownerJson as! [String: AnyObject])
        }
        
        events = []
        if let eventsJson = json["events"] {
            let eventsArray = eventsJson as! NSArray
            for (_, element) in eventsArray.enumerate() {
                self.events?.append(Event(json: element as! [String: AnyObject]))
            }
        }
        
        
    }
    
    
}