//
//  Event.swift
//  DriftReading
//
//  Created by Ming Gong on 8/13/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class Event: NSObject {
    var id: String!
    var content: String?
    var user: User?
    var address: Address?
    
    init(json: [String: AnyObject]) {
        self.id = json["id"] as! String
        self.content = json["content"] as? String
        if let userJson = json["user"] {
            self.user = User(json: userJson as! [String: NSObject])
        }
        
        if let addressJson = json["address"] {
            self.address = Address(json: addressJson as! [String: NSObject] )
        }
    }
}
