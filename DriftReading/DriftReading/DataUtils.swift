//
//  DataUtils.swift
//  DriftReading
//
//  Created by Ming Gong on 7/27/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class DataUtils: NSObject {
    class var sharedInstance: DataUtils {
        return dataUtils
    }
    
    func currentUser() -> User {
        let userData = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserKey) as! NSData
        return NSKeyedUnarchiver.unarchiveObjectWithData(userData) as! User
    }
}

private let dataUtils: DataUtils = {
    return DataUtils()
}()