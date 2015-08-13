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
            self.bookName.text = book.name
            self.bookAuthor.text = book.author
            self.bookSummary.text = book.summary
            self.bookOwner.text = book.owner?.username
            self.bookHolder.text = book.holder?.username
            if let imageUrl = book.imageUrl {
                self.bookImage.sd_setImageWithURL(NSURL(string: imageUrl))
            }
            }) { (error) -> Void in
                print(error)
        }
    }
    
    @IBAction func clickActionBtn(sender: AnyObject) {
        
    }
    
}
