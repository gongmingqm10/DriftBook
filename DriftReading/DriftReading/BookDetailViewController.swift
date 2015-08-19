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
    var actionStatus: String?

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookOwner: UILabel!
    @IBOutlet weak var bookHolder: UILabel!
    @IBOutlet weak var bookSummary: UILabel!
    @IBOutlet weak var actionBtn: UIButton!

    let driftAPI = DriftAPI()

    override func viewDidLoad() {

        LoadingOverlay.shared.showOverlay(self.navigationController?.view)

        driftAPI.getBookDetail(bookId as String!, success: {
            (book) -> Void in
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

            LoadingOverlay.shared.hideOverlayView()
        }) {
            (error) -> Void in
            self.dismissViewControllerAnimated(true, completion: {});
        }
    }

    func initBookStatus() {
        let currentUser = DataUtils.sharedInstance.currentUser()
        let status: String = (book?.status)!
        isOwner = currentUser.userId == book?.owner?.userId
        isHolder = currentUser.userId == book?.holder?.userId

        if isOwner {
            if status == Book.STATUS_STOP {
                actionBtn.enabled = true
                actionBtn.setTitle("重新放漂", forState: UIControlState.Normal)
                message = Constants.MESSAGE_REDROP_BOOK
                actionStatus = Book.STATUS_DRIFTING
            } else {
                actionBtn.enabled = true
                actionBtn.setTitle("收漂", forState: UIControlState.Normal)
                message = Constants.MESSAGE_RECEIVE_BOOK
                actionStatus = Book.STATUS_STOP
            }
            return
        }
        
        switch status {
        case Book.STATUS_STOP:
            actionBtn.enabled = false
            actionBtn.setTitle("已停漂", forState: UIControlState.Disabled)
        case Book.STATUS_READING:
            if isHolder {
                actionBtn.enabled = true
                actionBtn.setTitle("转漂", forState: UIControlState.Normal)
                message = Constants.MESSAGE_SHIFT_BOOK
                actionStatus = Book.STATUS_DRIFTING
            } else {
                actionBtn.enabled = false
                actionBtn.setTitle("在读中", forState: UIControlState.Disabled)
            }
        case Book.STATUS_DRIFTING:
            if isHolder {
                actionBtn.enabled = false
                actionBtn.setTitle("待漂", forState: UIControlState.Disabled)
            } else {
                actionBtn.enabled = true
                actionBtn.setTitle("求漂", forState: UIControlState.Normal)
                message = "求漂后，请主动联系\(book?.holder?.username as String!)获得此书"
                actionStatus = Book.STATUS_READING
            }
            default:
            actionBtn.hidden = false
        }
    }

    @IBAction func clickActionBtn(sender: AnyObject) {
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: {
            (alert: UIAlertAction!) in
            let currentUser = DataUtils.sharedInstance.currentUser()

            self.driftAPI.updateBookStatus(currentUser.userId, bookId: (self.book?.id)!, status: self.actionStatus!, success: {
                (book) -> Void in
                self.book = book
                self.initBookStatus()
            }, failure: {
                (error) -> Void in
            })
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
