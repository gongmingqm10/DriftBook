//
//  APIError.swift
//  DriftReading
//
//  Created by Ming Gong on 7/20/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

@objc class APIError: NSObject {
    var statusCode: Int
    var message: String
    
    private init(statusCode: Int, message: String) {
        self.statusCode = statusCode
        self.message = message
    }
    
    convenience init(errorDict: NSDictionary) {
        let statusCode = errorDict["statusCode"] as! Int
        let message = errorDict["message"] as! String
        
        self.init(statusCode: statusCode, message: message)
    }
    
    class func commonError() -> APIError {
        return APIError(statusCode: -1, message: "No error message")
    }
    
}