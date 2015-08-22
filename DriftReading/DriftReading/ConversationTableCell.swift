//
//  ConversationTableCell.swift
//  DriftReading
//
//  Created by Ming Gong on 8/21/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class ConversationTableCell: UITableViewCell {
    
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var latestContent: UILabel!
    @IBOutlet weak var conversationTime: UILabel!
    
    func populate(conversation: Conversation) {
        
        userName.text = conversation.user.username
        if let avatarUrl = conversation.user.avatar {
            userAvatar.sd_setImageWithURL(NSURL(string: avatarUrl))
        }
        
        let message = conversation.messages.first
        latestContent.text = message?.content
        
    }
    
}