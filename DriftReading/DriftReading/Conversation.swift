//
//  Conversation.swift
//  DriftReading
//
//  Created by Ming Gong on 8/21/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class Conversation: NSObject {
    var user: User!
    var messages: [Message]!
    
    init(json: [String: AnyObject]) {
        if let userJson = json["user"] {
            self.user = User(json: userJson as! [String: NSObject])
        }
        
        messages = []
        if let messagesJson = json["messages"] {
            let messageAray = messagesJson as! NSArray
            for (_, element) in messageAray.enumerate() {
                self.messages.append(Message(json: element as! [String: NSObject]))
            }
        }
        
    }
    
    
}