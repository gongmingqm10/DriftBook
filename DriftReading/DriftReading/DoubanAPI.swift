//
//  DoubanAPI.swift
//  DriftReading
//
//  Created by Ming Gong on 7/27/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class DoubanAPI: NSObject {
    
    let API_HOST = "https://api.douban.com"
    
    var apiSessionManager: APISessionManager
    
    override init() {
        apiSessionManager = APISessionManager(url: API_HOST)
        super.init()
    }
    
    func searchBooks(keyword: String, success: (books: [DoubanBook]) -> Void, failure: (error: APIError) -> Void) {
        apiSessionManager.GET("/v2/book/search", parameters: ["q": keyword, "apikey": "006d9d40afc7547e0148d7c20f55fd7a"],
            success: { (session: NSURLSessionDataTask!, responseObject: AnyObject!) -> Void in
                let responseJson = responseObject as! [String: AnyObject]
                let booksObject = responseJson["books"]
                let bookJson = booksObject as! NSArray
                var books: [DoubanBook] = []
                for (_, element) in bookJson.enumerate() {
                    let bookDictionary = element as! [String: AnyObject]
                    books.append(DoubanBook(json: bookDictionary))
                }
                success(books: books)
                
            },
            failure: { error in
                failure(error: error)
            }
        )
    }
}