//
//  Message.swift
//  DriftReading
//
//  Created by Ming Gong on 8/21/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class Message: NSObject {
    var content: String!
    var sender: User!
    var receiver: User!
    
    init(json: [String: NSObject]) {
        self.content = json["content"] as! String
        if let receiverJson = json["receiver"] {
            self.receiver = User(json: receiverJson as! [String: NSObject])
        }
        if let senderJson = json["sender"] {
            self.sender = User(json: senderJson as! [String: NSObject])
        }
    }
}
