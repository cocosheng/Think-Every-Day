//
//  SignUpViewController.swift
//  Think Every Day
//
//  Created by Mercy on 10/3/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var UsernameSignUp: UITextField!
    @IBOutlet weak var PasswordSignUp: UITextField!
    
    @IBOutlet weak var PasswordCheckSignUp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUpButton(_ sender: UIButton) {
        if UsernameSignUp.text == "" {
            self.showErrorAlert(errorTitle:"Sign up unsuccessful", errorMessage:"Username cannot be empty.")
            NSLog("debug Username cannot be empty")
            return
        } else if (PasswordSignUp.text?.characters.count)! < 6 {
            // Firebase requires password to be at least 6 char.
            self.showErrorAlert(errorTitle:"Sign up unsuccessful", errorMessage:"Password must be at last 6 characters.")
            NSLog("debug Password must be at least 6 characters.")
            return
        }
        if PasswordSignUp.text != PasswordCheckSignUp.text {
            self.showErrorAlert(errorTitle:"Sign up unsuccessful", errorMessage:"Your passwords do not match.")
            NSLog("debug Your passwords do not match.")
            return
        }
        FIRAuth.auth()?.createUser(withEmail: UsernameSignUp.text!, password: PasswordSignUp.text!, completion: {
                user, error in
            if error != nil {
                // Show alert user already exists.
                self.showErrorAlert(errorTitle:"Sign up unsuccessful", errorMessage:"User email already registered.")
                NSLog("debug User email already registered.")
                return
            }
            let user = FIRAuth.auth()?.currentUser
            user?.sendEmailVerification(completion: { error in
                if let error = error {
                    // Show alert user email invalid.
                    self.showErrorAlert(errorTitle:"Sign up unsuccessful", errorMessage:error.localizedDescription)
                    NSLog("debug User email invalid.")
                    return
                } else {
                    // Show alert email sent.
                    self.showAlert(alertTitle: "Sign up successful", alertMessage: "Verification email sent.", cancelButtonTitle: "Got it!")
                    NSLog("debug Email sent")
                }
            })
            
            NetworkingService().saveUserInfo(user: FIRAuth.auth()!.currentUser!, email: self.UsernameSignUp.text!)
            
            self.performSegue(withIdentifier: "SignedUpToSignIn",sender: self)
            NSLog("debug User created, now go to sign in page")
        })
    }
    
    @IBAction func HaveAccountButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignedUpToSignIn", sender: self)
    }
}
