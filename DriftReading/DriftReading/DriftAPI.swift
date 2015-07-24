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
                User.new()
                success()
            },
            failure: { error in
                failure(error: error)
            }
        )
    }
}