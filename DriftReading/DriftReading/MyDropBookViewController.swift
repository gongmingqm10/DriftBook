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
        cell.onButtonTapped = {(book) -> Void in
            let message = book.status == "stop" ? "重新放漂之后，你的图书将处于可借阅状态。确定继续吗？" : "收漂之后，你的漂友将不能继续阅读你的图书。确定继续吗？"
            let status = book.status == "stop" ? "drifting" : "stop"
            
            let alertController = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
                let currentUser = DataUtils.sharedInstance.currentUser()
                self.driftAPI.updateBookStatus(currentUser.userId, bookId: (book.id)!, status: status, success: {(book) -> Void in
                    cell.populate(book)
                    self.updateBook(book)
                    }, failure: {(error) -> Void in
                        self.showErrorMessage(error)
                })
            }))
            alertController.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }

        return cell
    }
    
    private func updateBook(book: Book) {
        for var index = 0; index < books.count; ++index {
            if books[index].id == book.id {
                books[index] = book
            }
        }
    }
    
    private func showErrorMessage(error: APIError) {
        let alertController = UIAlertController(title: "错误", message: error.message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}
