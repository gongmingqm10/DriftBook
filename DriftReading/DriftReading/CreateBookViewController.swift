//
//  CreateBookViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 7/27/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class CreateBookViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var bookSearchBar: UISearchBar!
    @IBOutlet weak var bookTableView: UITableView!
    
    let doubanAPI = DoubanAPI()
    let driftAPI = DriftAPI()
    var books: [DoubanBook] = []
    
    override func viewDidLoad() {
        bookTableView.delegate = self
        bookTableView.dataSource = self
        bookSearchBar.delegate = self
    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        doubanAPI.searchBooks(searchText, success: { (books) -> Void in
            self.books = books
            self.bookTableView.reloadData()
            }) { (error) -> Void in
                print(error.description)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = bookTableView.dequeueReusableCellWithIdentifier("DoubanTableCell", forIndexPath: indexPath) as! DoubanTableCell
        let book = books[indexPath.row]
        cell.populate(book)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let book = books[indexPath.row]
        
        let alertController = UIAlertController(title: "提示", message: "确定将《\(book.name)》放漂吗？", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
            let user = DataUtils.sharedInstance.currentUser()
            self.driftAPI.createDoubanBook(user.userId, book: book, success: { () -> Void in
                self.navigationController?.popViewControllerAnimated(true)
                }, failure: { (error) -> Void in
                    self.showErrorAlert()
            })
        }))
        alertController.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func showErrorAlert() {
        let alertController = UIAlertController(title: "提示", message: "图书添加失败，请稍后重试", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
