//
//  DiscoveryViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 7/7/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class DiscoveryViewController: UITableViewController {

    let driftAPI = DriftAPI()
    
    @IBOutlet var booksTableView: UITableView!
    var books: [Book] = []
    
    let TYPE_DRIFTING = "drifting"
    let TYPE_READING = "reading"
    
    override func viewDidLoad() {
        loadBooksByType(TYPE_DRIFTING)
    }
    
    private func loadBooksByType(type: String) {
        driftAPI.getBooks(type, success: { (books) -> Void in
            self.books = books
            self.booksTableView.reloadData()
            }) { (error) -> Void in
                print(error.description)
        }
    }

    @IBAction func switchSegment(sender: UISegmentedControl) {
        loadBooksByType(sender.selectedSegmentIndex == 0 ? TYPE_DRIFTING : TYPE_READING)
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = booksTableView.dequeueReusableCellWithIdentifier("BookTableCell", forIndexPath: indexPath) as! BookTableCell
        let book = books[indexPath.row]
        cell.populate(book)
        return cell
    }
}
