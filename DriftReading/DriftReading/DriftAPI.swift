//
//  DriftAPI.swift
//  DriftReading
//
//  Created by Ming Gong on 7/20/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class DriftAPI: NSObject {
    
    let API_HOST = "http://localhost:3000"
    
    var apiSessionManager: APISessionManager
    
    override init() {
        apiSessionManager = APISessionManager(url: API_HOST)
        super.init()
    }
    
    func loginWith(email: String, password: String, success: () -> Void, failure: (error: APIError) -> Void) {
        apiSessionManager.POST("/api/login",
            parameters: ["email": email, "password": password],
            success: { (session: NSURLSessionDataTask!, responseObject: AnyObject!) -> Void in
                let responseJson: Dictionary = responseObject as! Dictionary<String, String>
                let data = NSKeyedArchiver.archivedDataWithRootObject(User(json: responseJson))
                NSUserDefaults.standardUserDefaults().setObject(data, forKey: Constants.UserKey)
                success()
            },
            failure: { error in
                failure(error: error)
            }
        )
    }
    
    func getBooks(filterType: String, success: (books: NSArray) -> Void, failure: (error: APIError) -> Void) {
        apiSessionManager.GET("/api/books", parameters: ["filter": filterType],
            success: { (session: NSURLSessionDataTask!, responseObject: AnyObject!) -> Void in
                let responseJson = responseObject as! NSArray
                let books = NSMutableArray()
                for bookJson in responseJson {
                    let bookDictionary = bookJson as! Dictionary<String, String>
                    books.addObject(Book(json: bookDictionary))
                }
                success(books: books)
                
            },
            failure: { error in
                failure(error: error)
            }
        )
    }
    
}