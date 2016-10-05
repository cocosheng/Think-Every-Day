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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUpButton(_ sender: UIButton) {
        if PasswordSignUp.text != PasswordCheckSignUp.text {
            // TODO: show alert for dismatched passwords.
            
            print("Your passwords do not match.")
            return
        }
        FIRAuth.auth()?.createUser(withEmail: UsernameSignUp.text!, password: PasswordSignUp.text!, completion: {
                user, error in
            if error != nil {
                // Show alert user already exists.
                print("User email already registered.")
                return
            }
            let user = FIRAuth.auth()?.currentUser
            user?.sendEmailVerification(completion: { error in
                if let error = error {
                    // Show alert user email invalid.
                    print("User email invalid.")
                } else {
                    // Show alert email sent.
                    print("Email sent")
                }
            })
            // directly go to main view
            // // should go to sign in page and treat as normal signin user.
            //                self.performSegue(withIdentifier: "SignedUp", sender: self)
            self.performSegue(withIdentifier: "SignedUpToSignIn",sender: self)
            print("User created, now go to sign in page")
        })
    }
}
