//
//  AcceptBookViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 7/7/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class AcceptBookViewController: UITableViewController {
    
    @IBOutlet var acceptBookTable: UITableView!
    
    let driftAPI = DriftAPI()
    var books: [Book] = []
    
    override func viewDidLoad() {
        let user = DataUtils.sharedInstance.currentUser()
        driftAPI.getHoldBooks(user.userId, success: { (books) -> Void in
            self.books = books
            self.acceptBookTable.reloadData()
            }) { (error) -> Void in
                print(error.description)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = acceptBookTable.dequeueReusableCellWithIdentifier("AcceptBookCell", forIndexPath: indexPath) as! AcceptBookCell
        let book = books[indexPath.row]
        cell.populate(book)
        return cell
    }
}
