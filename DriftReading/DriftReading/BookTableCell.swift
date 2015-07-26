//
//  BookTableCell.swift
//  DriftReading
//
//  Created by Ming Gong on 7/26/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class BookTableCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookSummary: UILabel!
    @IBOutlet weak var bookLocation: UILabel!
    @IBOutlet weak var bookDistance: UILabel!
    
    func populate(book: Book) {
        bookName.text = book.name
        bookAuthor.text = book.author
        bookSummary.text = book.summary
        bookLocation.text = book.address?.info()
        if let imageUrl = book.imageUrl {
            bookImage.sd_setImageWithURL(NSURL(string: imageUrl))
        }
        
    }
}
