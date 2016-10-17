//
//  ForgotPasswordViewController.swift
//  Think Every Day
//
//  Created by Mercy on 10/3/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

import Firebase

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var EmailForgotPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPasswordForgotPassword(_ sender: UIButton) {
        let email = EmailForgotPassword.text
        if email == "" {
            // TODO: alert
            NSLog("debug Email address cannot be empty")
            return
        }
        FIRAuth.auth()?.sendPasswordReset(withEmail: email!, completion: {
            error in
            if let error = error {
                NSLog("debug Email address is incorrect.")
                return
            }
            // TODO: Show alert.
            NSLog("debug Password reset email sent.")
            self.performSegue(withIdentifier: "ForgotPasswordToSignIn", sender: self)
        })
    }
    
    @IBAction func HaveAccountButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ForgotPasswordToSignIn", sender: self)
    }

}
