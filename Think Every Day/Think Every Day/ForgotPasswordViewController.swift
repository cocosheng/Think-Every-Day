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
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPasswordForgotPassword(_ sender: UIButton) {
        let email = EmailForgotPassword.text
        if email == "" {
            self.showErrorAlert(errorTitle: "Reset password unsuccessful", errorMessage: "Email address cannot be empty.")
            NSLog("debug Email address cannot be empty")
            return
        }
        FIRAuth.auth()?.sendPasswordReset(withEmail: email!, completion: {
            error in
            if let error = error {
                self.showErrorAlert(errorTitle: "Reset password unsuccessful", errorMessage: error)
                NSLog("debug Email address is incorrect.")
                return
            }
            self.showAlert(alertTitle: "Reset password successful", alertMessage: "Password reset email is sent", cancelButtonTitle: "Got it!")

            NSLog("debug Password reset email sent.")
            self.performSegue(withIdentifier: "ForgotPasswordToSignIn", sender: self)
        })
    }
    
    @IBAction func HaveAccountButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ForgotPasswordToSignIn", sender: self)
    }

}
