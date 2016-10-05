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
        FIRAuth.auth()?.sendPasswordReset(withEmail: email!, completion: {
            error in
            if let error = error {
                print("Email address is incorrect.")
            } else {
                // TODO: Show alert.
                print("Password reset email sent.")
                self.performSegue(withIdentifier: "forgotPasswordResetSignIn", sender: self)
            }
        })
    }

}
