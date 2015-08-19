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
    
    var selectedBook: Book?
    var currentType: String?
    
    override func viewDidLoad() {
        currentType = TYPE_DRIFTING
        
    }
    
    override func viewDidAppear(animated: Bool) {
        loadBooksByType()
    }
    
    private func loadBooksByType() {
        driftAPI.getBooks(currentType!, success: { (books) -> Void in
            self.books = books
            self.booksTableView.reloadData()
            }) { (error) -> Void in
                print(error.description)
        }
    }

    @IBAction func switchSegment(sender: UISegmentedControl) {
        currentType = sender.selectedSegmentIndex == 0 ? TYPE_DRIFTING : TYPE_READING
        loadBooksByType()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "BookDetailSegue" {
            let bookDetailController = segue.destinationViewController as! BookDetailViewController
            bookDetailController.bookId = selectedBook!.id
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedBook = books[indexPath.row]
        self.performSegueWithIdentifier("BookDetailSegue", sender: self)
        
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
