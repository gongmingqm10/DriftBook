//
//  User.swift
//  DriftReading
//
//  Created by Ming Gong on 7/24/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    var userId: String!
    var email: String!
    var username: String!
    var avatar: String?
    var telephone: String?
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        self.userId = aDecoder.decodeObjectForKey("userId") as! String
        self.email = aDecoder.decodeObjectForKey("email") as! String
        self.username = aDecoder.decodeObjectForKey("username") as! String
        self.avatar = aDecoder.decodeObjectForKey("avatar") as? String
        self.telephone = aDecoder.decodeObjectForKey("telephone") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.username, forKey: "userId")
        aCoder.encodeObject(self.email, forKey: "email")
        aCoder.encodeObject(self.username, forKey: "username")
        aCoder.encodeObject(self.avatar, forKey: "avatar")
        aCoder.encodeObject(self.telephone, forKey: "telephone")
    }
    
    init(json: Dictionary<String, String>) {
        self.userId = json["id"] as String!
        self.email = json["email"] as String!
        self.username = json["username"] as String!
        self.avatar = json["avatar"] as String?
        self.telephone = json["telephone"] as String?
    }
    
}