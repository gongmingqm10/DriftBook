//
//  MyBookCell.swift
//  DriftReading
//
//  Created by Ming Gong on 7/27/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class MyBookCell: UITableViewCell {

    var onButtonTapped : ((book: Book) -> Void)? = nil
 
    @IBOutlet weak var bookImage: UIImageView!
    
    @IBOutlet weak var bookName: UILabel!
    
    @IBOutlet weak var bookAuthor: UILabel!
    
    @IBOutlet weak var bookSummary: UILabel!
    
    @IBOutlet weak var bookLocation: UILabel!
    
    @IBOutlet weak var receiveBtn: UIButton!

    let driftAPI = DriftAPI()
    var book: Book?
    
    @IBAction func receiveBtnClick(sender: AnyObject) {
        self.onButtonTapped!(book: book!)
    }
    func populate(book: Book) {
        self.book = book
        bookName.text = book.name
        bookAuthor.text = book.author
        bookSummary.text = book.summary
        receiveBtn.setTitle(book.status == "stop" ? "重新放漂" : "收漂", forState: UIControlState.Normal)
        if let imageUrl = book.imageUrl {
            bookImage.sd_setImageWithURL(NSURL(string: imageUrl))
        }
    }


}
