//
//  ChattingViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 9/6/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class ChattingViewController: UITableViewController {

    var messages: [Message] = []
    let driftAPI = DriftAPI()
    
    @IBOutlet var messageTableView: UITableView!
    
    override func viewDidLoad() {
        self.messageTableView.rowHeight = UITableViewAutomaticDimension
        self.messageTableView.estimatedRowHeight = 90.0
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        let messageFriendCell = messageTableView.dequeueReusableCellWithIdentifier("FriendMessageCell", forIndexPath: indexPath) as! MessageFriendCell
        messageFriendCell.populate(message)
        return messageFriendCell
    }
    
}
