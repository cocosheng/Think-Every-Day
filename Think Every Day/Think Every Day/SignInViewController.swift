//
//  SignInViewController.swift
//  Think Every Day
//
//  Created by Mercy on 10/3/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

import Firebase

import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

@objc(SignInViewController)

class SignInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var appIconMainMenu: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.appIconMainMenu.image = #imageLiteral(resourceName: "AppIconMainMenu")
        // TODO: Google sign-in button.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignInButtonTapped(_ sender: UIButton) {
        NSLog("debug sign in tapped")
        // // can get the user's account data from the user object that's passed to the callback method
        FIRAuth.auth()?.signIn(withEmail: UsernameTextField.text!, password: PasswordTextField.text!, completion: {
            user, error in
            if error != nil {
                // TODO: Show alert incorrect password.
                
                // Password or email address not recognized?
                NSLog("debug Your password is incorrect.")
                return
            }
            // Successfully signed up. Go to main menu.
            self.performSegue(withIdentifier: "SignedUpToMainMenu",sender: self)
            NSLog("debug Successful signed in.")
            self.dismiss(animated: true, completion: nil)
        })
    
    }
    @IBAction func RegisterButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignInToSignUp", sender: self)
    }
    
    @IBAction func ForgotPasswordTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignInToForgotPassword", sender: self)
    }
    
    @IBAction func GoogleSignInButtonTapped(_ sender: UIButton) {
        googleFirebaseLogin()
    }
    
    @IBAction func FacebookSiginInButtonTapped(_ sender: UIButton) {
        facebookFirebaseLogin()
    }
    
    func googleFirebaseLogin() {
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signInSilently()
    }
    
    func facebookFirebaseLogin() {
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["email"], from: self, handler: { (result, error) in
            if let error = error {
                NSLog(error.localizedDescription)
            } else if result!.isCancelled {
                NSLog("debug FBLogin cancelled")
            } else {
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseLogin(credential)
            }
        })
    }
    
    // Firebase login for Google and FB login.
    func firebaseLogin(_ credential: FIRAuthCredential) {
        if let user = FIRAuth.auth()?.currentUser {
            user.link(with: credential) { (user, error) in
                if let error = error {
                    NSLog(error.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "SignedUpToMainMenu", sender: self)
            }
        } else {
            FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                if let error = error {
                    NSLog(error.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "SignedUpToMainMenu", sender: self)
            }
        }
    }

    // GIDSignInDelegate function. For Google Signin.
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            NSLog(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                          accessToken: (authentication?.accessToken)!)
        firebaseLogin(credential)
    }

}
