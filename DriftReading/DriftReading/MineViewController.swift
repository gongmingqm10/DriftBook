//
//  MineViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 7/7/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        let data = NSUserDefaults.standardUserDefaults().valueForKey(Constants.UserKey) as! NSData
        let user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! User
        
        self.usernameLabel.text = user.username
        self.emailLabel.text = user.email
        
        if let avatarUrl = user.avatar {
            self.userAvatar.sd_setImageWithURL(NSURL(string: avatarUrl), placeholderImage: UIImage(named: "IconAnonymous"))
        }
    }
}
