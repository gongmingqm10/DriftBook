//
//  Constants.swift
//  DriftReading
//
//  Created by Ming Gong on 7/24/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class Constants: NSObject {
    class var UserKey: String {
        return "user"
    }
    
    class var MapApiKey: String {
        return "a130880c24eec8b1a1d4f1e99c51c6d6"
    }

    class var MESSAGE_REDROP_BOOK: String {
        return "重新放漂之后，你的图书将处于可借阅状态。确定继续吗？"
    }

    class var MESSAGE_RECEIVE_BOOK: String {
        return "收漂之后，你的漂友将不能继续阅读你的图书。确定继续吗？"
    }

    class var MESSAGE_SHIFT_BOOK: String {
        return "转漂之后，此书将传递给下一个漂友。确定继续吗？"
    }

}
