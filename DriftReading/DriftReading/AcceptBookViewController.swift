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
    var selectedBook: Book?

    override func viewDidAppear(animated: Bool) {
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "BookDetailSegue" {
            let bookDetailController = segue.destinationViewController as! BookDetailViewController
            bookDetailController.bookId = selectedBook!.id
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedBook = books[indexPath.row]
        self.performSegueWithIdentifier("BookDetailSegue", sender: self)

    }


}
