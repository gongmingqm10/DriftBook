//
//  APISessionManager.swift
//  DriftReading
//
//  Created by Ming Gong on 7/20/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class APISessionManager: NSObject {
    var sessionManager: AFHTTPSessionManager
    
    init(sessionManager: AFHTTPSessionManager) {
        self.sessionManager = sessionManager
    }
    
    convenience init(url: String) {
        self.init(sessionManager: AFHTTPSessionManager(baseURL: NSURL(string: url)))
    }
    
    func POST(URLString: String!, parameters: AnyObject!, success: ((NSURLSessionDataTask!, AnyObject!) -> Void)!, failure: ((APIError) -> Void)!) -> NSURLSessionDataTask! {
        
        return sessionManager.POST(URLString, parameters: parameters, success: success, failure: buildAPIError(failure))
    }
    
    func PUT(URLString: String!, parameters: AnyObject!, success: ((NSURLSessionDataTask!, AnyObject!) -> Void)!, failure: ((APIError) -> Void)!) -> NSURLSessionDataTask! {
        
        return sessionManager.PUT(URLString, parameters: parameters, success: success, failure: buildAPIError(failure))
    }
    
    func GET(URLString: String!, parameters: AnyObject!, success: ((NSURLSessionDataTask!, AnyObject!) -> Void)!, failure: ((APIError) -> Void)!) -> NSURLSessionDataTask! {
        
        return sessionManager.GET(URLString, parameters: parameters, success: success, failure: buildAPIError(failure))
    }
    
    func buildAPIError(failure: (APIError -> Void)) -> ((NSURLSessionDataTask!, NSError!) -> ()) {
        let failureError: ((NSURLSessionDataTask!, NSError!) -> ()) = { task, error in
            if let info = error.userInfo["JSONResponseSerializerWithDataKey"] as? NSDictionary {
                failure(APIError(errorDict: info))
            } else {
                failure(APIError.commonError())
            }
        }
        return failureError
    }
    
    
    
    
}
