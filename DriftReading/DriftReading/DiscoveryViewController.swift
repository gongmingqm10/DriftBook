//
//  DiscoveryViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 7/7/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class DiscoveryViewController: UITableViewController {

    let driftAPI = DriftAPI()
    
    override func viewDidLoad() {
        driftAPI.getBooks("drifting", success: { (books) -> Void in
            print(books)
            }) { (error) -> Void in
                print(error.description)
        }
    }
}
