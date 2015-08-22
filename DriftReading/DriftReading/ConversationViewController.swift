//
//  ConversationViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 8/21/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class ConversationViewController: UITableViewController {
    
    @IBOutlet var conversationTable: UITableView!
    let driftAPI = DriftAPI()
    var conversations: [Conversation] = []
    var selectedConversation: Conversation?
    
    override func viewDidAppear(animated: Bool) {
        let user = DataUtils.sharedInstance.currentUser()
        driftAPI.getMessages(user.userId, success: { (conversations) -> Void in
            self.conversations = conversations
            self.conversationTable.reloadData()
            }) { (error) -> Void in
                print(error.description)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 74
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = conversationTable.dequeueReusableCellWithIdentifier("ConversationTableCell", forIndexPath: indexPath) as! ConversationTableCell
        let conversation = conversations[indexPath.row]
        cell.populate(conversation)
        return cell
    }
}