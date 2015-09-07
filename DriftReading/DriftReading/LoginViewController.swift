//
//  LoginViewController.swift
//  DriftReading
//
//  Created by Ming Gong on 7/6/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class LoginViewController: ViewController, UITextFieldDelegate {
    
    let driftAPI = DriftAPI()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        if let _ = NSUserDefaults.standardUserDefaults().valueForKey(Constants.UserKey) {
            self.performSegueWithIdentifier("HomeSegue", sender: self)
        }
        self.passwordTextField.delegate = self
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        driftAPI.loginWith(email, password: password,
            success: { () in
                self.performSegueWithIdentifier("HomeSegue", sender: self)
            }) { (error: APIError) -> Void in
                let alertController = UIAlertController(title: "提示", message: "用户名或密码错误", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
