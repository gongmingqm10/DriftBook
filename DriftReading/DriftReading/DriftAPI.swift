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
                var responseJson: Dictionary = responseObject as! Dictionary<String, String>
                success()
            },
            failure: { error in
                failure(error: error)
            }
        )
    }
}