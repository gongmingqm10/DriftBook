//
//  MessageFriendCell.swift
//  DriftReading
//
//  Created by Ming Gong on 9/6/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class MessageFriendCell: UITableViewCell {
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var messageTime: UILabel!
    
    override func layoutSubviews() {
        userAvatar.layer.borderWidth = 1
        userAvatar.layer.borderColor = UIColor.grayColor().CGColor
        userAvatar.layer.cornerRadius = userAvatar.frame.size.width / 2.0
        userAvatar.clipsToBounds = true
    }
    
    func populate(message: Message) {
        
        nickname.text = message.sender.username
        contentLabel.text = message.content
        
        if let imageUrl = message.sender.avatar {
            userAvatar.sd_setImageWithURL(NSURL(string: imageUrl))
        }
        
        let blueImage = UIImage(named: "ChatBlue")
        let blueImageView = UIImageView(frame: CGRect(x: -20, y: -8, width: contentLabel.frame.size.width + 20, height: contentLabel.frame.size.height + 20))
        blueImageView.image = blueImage
        
        contentLabel.addSubview(blueImageView)
    }
    
}
