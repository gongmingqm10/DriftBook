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
    
    init(json: [String: AnyObject]) {
        self.id = json["id"] as! String
        self.name = json["name"] as! String
        self.author = json["author"] as! String
        self.summary = json["summary"] as! String
        self.status = json["summary"] as! String
        self.imageUrl = json["image"] as! String
        self.address = Address(json: json["address"] as! [String: AnyObject])
    }
    
    
}