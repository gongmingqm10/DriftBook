//
//  MyDropBookViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 7/27/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class MyDropBookViewController: UITableViewController {
    
    @IBOutlet var dropTableView: UITableView!
    let driftAPI = DriftAPI()
    var books: [Book] = []
    
    override func viewDidLoad() {
        let user = DataUtils.sharedInstance.currentUser()
        driftAPI.getOweBooks(user.userId, success: { (books) -> Void in
            self.books = books
            self.dropTableView.reloadData()
            }) { (error) -> Void in
                print(error.description)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 158
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = dropTableView.dequeueReusableCellWithIdentifier("MyBookCell", forIndexPath: indexPath) as! MyBookCell
        let book = books[indexPath.row]
        cell.populate(book)
        return cell
    }

}
