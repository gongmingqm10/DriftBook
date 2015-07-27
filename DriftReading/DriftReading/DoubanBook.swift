//
//  DoubanBook.swift
//  DriftReading
//
//  Created by Ming Gong on 7/27/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class DoubanBook: NSObject {
    var doubanid: String!
    var name: String!
    var author: [String]
    var summary: String!
    var imageUrl: String!
    
    init(json: [String: AnyObject]) {
        self.doubanid = json["id"] as! String
        self.name = json["title"] as! String
        self.summary = json["summary"] as! String
        
        let jsonImages = json["images"] as! [String: AnyObject]
        self.imageUrl = jsonImages["large"] as? String
        
        self.author = json["author"] as! [String]
        
        
    }
    
}