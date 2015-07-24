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
    
    init(json: Dictionary<String, String>) {
        self.id = json["id"]
        self.name = json["name"]
        self.author = json["author"]
        self.summary = json["summary"]
        self.status = json["summary"]
        self.imageUrl = json["image"]
        self.address = Address(json: json["address"] as! Dictionary<String, String>)
    }
    
    
}