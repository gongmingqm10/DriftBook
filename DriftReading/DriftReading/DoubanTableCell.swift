//
//  DoubanTableCell.swift
//  DriftReading
//
//  Created by Ming Gong on 7/27/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class DoubanTableCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    
    @IBOutlet weak var bookName: UILabel!
    
    @IBOutlet weak var bookAuthor: UILabel!
    
    @IBOutlet weak var bookSummary: UILabel!
    
    func populate(book: DoubanBook) {
        bookName.text = book.name
        bookAuthor.text = book.author.first
        bookSummary.text = book.summary
        if let imageUrl = book.imageUrl {
            bookImage.sd_setImageWithURL(NSURL(string: imageUrl))
        }
    }
}
