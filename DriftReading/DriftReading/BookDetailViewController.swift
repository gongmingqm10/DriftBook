//
//  BookDetailViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 7/28/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var bookId: String?
    var book: Book?
    var isOwner = false
    var isHolder = false
    var message = ""
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookOwner: UILabel!
    @IBOutlet weak var bookHolder: UILabel!
    @IBOutlet weak var bookSummary: UILabel!
    @IBOutlet weak var actionBtn: UIButton!
    
    let driftAPI = DriftAPI()
    
    override func viewDidLoad() {
        
        driftAPI.getBookDetail(bookId as String!, success: { (book) -> Void in
            self.book = book
            self.bookName.text = book.name
            self.bookAuthor.text = book.author
            self.bookSummary.text = book.summary
            self.bookOwner.text = book.owner?.username
            self.bookHolder.text = book.holder?.username
            if let imageUrl = book.imageUrl {
                self.bookImage.sd_setImageWithURL(NSURL(string: imageUrl))
            }
            self.initBookStatus()
            }) { (error) -> Void in
                print(error)
        }
    }
    
    func initBookStatus() {
        let currentUser = DataUtils.sharedInstance.currentUser()
        let status = book?.status
        isOwner = currentUser.userId == book?.owner?.userId
        isHolder = currentUser.userId == book?.holder?.userId
        
        if isOwner && status != "stop" {
            actionBtn.enabled = true
            actionBtn.setTitle("收漂", forState: UIControlState.Normal)
            actionBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            message = "收漂之后，你的漂友将不能继续阅读你的图书。确定继续吗？"
        } else if status == "reading" {
            if isHolder {
                actionBtn.setTitle("转漂", forState: UIControlState.Normal)
                actionBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Disabled)
                message = "转漂之后，此书将传递给下一个漂友。确定继续吗？"
            } else {
                actionBtn.enabled = false
                actionBtn.setTitle("在读", forState: UIControlState.Disabled)
                actionBtn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            }
        } else if status == "drifting" && !isHolder {
            actionBtn.enabled = true
            actionBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            actionBtn.setTitle("求漂", forState: UIControlState.Normal)
            message = "求漂后，请主动联系\(book?.holder?.username as String!)获得此书"
        } else {
            actionBtn.enabled = true
            actionBtn.hidden = true
        }
    }
    
    @IBAction func clickActionBtn(sender: AnyObject) {
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
            let currentUser = DataUtils.sharedInstance.currentUser()
            if self.isOwner {
                self.driftAPI.updateBookStatus(currentUser.userId, bookId: (self.book?.id)!, status: "stop", success: {(book) -> Void in
                    //Update the UI view. 收漂操作后
                    self.book = book
                    self.initBookStatus()
                }, failure: {(error) -> Void in
                    self.showErrorMessage(error)
                })
            } else if self.isHolder && self.book?.status == "reading" {
                self.driftAPI.updateBookStatus(currentUser.userId, bookId: (self.book?.id)!, status: "drifting", success: {(book) -> Void in
                    //Update the UI view. 转漂操作后
                    self.book = book
                    self.initBookStatus()
                }, failure: {(error) -> Void in
                    self.showErrorMessage(error)
                })
            } else if !self.isHolder && self.book?.status == "drifting" {
                self.driftAPI.updateBookStatus(currentUser.userId, bookId: (self.book?.id)!, status: "reading", success: {(book) -> Void in
                    //Update the UI view. 求漂操作后
                    self.book = book
                    self.initBookStatus()
                }, failure: {(error) -> Void in
                    self.showErrorMessage(error)
                })
            }
        }))
        alertController.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    private func showErrorMessage(error: APIError) {
        let alertController = UIAlertController(title: "错误", message: error.message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
