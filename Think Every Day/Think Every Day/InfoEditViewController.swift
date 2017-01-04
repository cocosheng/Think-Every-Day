//
//  InfoEditViewController.swift
//  Think Every Day
//
//  Created by Mercy on 10/18/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

class InfoEditViewController: UIViewController {
    
    @IBOutlet weak var resetUserNameButton: UIButton!
    
    @IBOutlet weak var resetPasswordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Edit Profile"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: If facebook/Google sign in, no password rest?
    @IBAction func resetPasswordButtonReset(_ sender: AnyObject) {
        let alertTitle = "Reset Password"
        let alertMessage = "Please enter your current password"
        let textFieldPlaceholder = "Password"
        let errorMessage = "Password cannot be empty"
        let alertController = self.showChangeContentAlert(alertTitle: alertTitle, alertMessage: alertMessage, textFieldPlaceholder: textFieldPlaceholder, errorMessage: errorMessage)

    }
    
    @IBAction func resetUserNameButtonReset(_ sender: AnyObject) {
        let alertTitle = "Reset User Name"
        let alertMessage = "Please enter your new user name"
        let textFieldPlaceholder = "User Name"
        let errorMessage = "User name cannot be empty"
        let alertController = self.showChangeContentAlert(alertTitle: alertTitle, alertMessage: alertMessage, textFieldPlaceholder: textFieldPlaceholder, errorMessage: errorMessage)
    }

}
