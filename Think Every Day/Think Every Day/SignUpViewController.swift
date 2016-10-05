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
        FIRAuth.auth()?.createUser(withEmail: UsernameSignUp.text!, password: PasswordSignUp.text!, completion: {
            user, error in
            if error != nil {
                // user already existed
            }
            else{
                print("User created")
                // directly go to main view
                self.performSegue(withIdentifier: "SignedUp", sender: self)
            }
        })
    }
}
