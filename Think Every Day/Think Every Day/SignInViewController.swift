//
//  SignInViewController.swift
//  Think Every Day
//
//  Created by Mercy on 10/3/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

import Firebase

@objc(SignInViewController)
class SignInViewController: UIViewController {

    @IBOutlet weak var UsernameSignInTextField: UITextField!
    @IBOutlet weak var PasswordSignInTextField: UITextField!

    @IBOutlet weak var AppIconSignIn: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AppIconSignIn.image = #imageLiteral(resourceName: "AppIconMainMenu")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignInButtonTapped(_ sender: UIButton) {
        // // can get the user's account data from the user object that's passed to the callback method
        FIRAuth.auth()?.signIn(withEmail: UsernameSignInTextField.text!, password: PasswordSignInTextField.text!, completion: {
            user, error in
            if error != nil{
                // TODO: Show alert incorrect password.
                
                // Password or email address not recognized?
                print("Your password is incorrect.")
            }
            else{
                // Successfully signed up. Go to main menu.
                self.performSegue(withIdentifier: "SignedUpMainMenu", sender: self)
                print("Successful signed in.")
                self.dismiss(animated: true, completion: nil);
            }
        })
    }

}
