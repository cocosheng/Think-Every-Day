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
    
    // fb button.
    @IBOutlet weak var loginButton: FBSDKLoginButton!

    //    @IBOutlet weak var googleSignInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.appIconMainMenu.image = #imageLiteral(resourceName: "AppIconMainMenu")
        // TODO: Google sign-in button.
        
        // TODO: FB sign-in button.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignInButtonTapped(_ sender: UIButton) {
        NSLog("debug sign in tapped")
        if UsernameTextField.text == "" {
            NSLog("debug Email address cannot be empty")
            return
        } else if PasswordTextField.text == "" {
            NSLog("debug Password cannot be empty")
            return
        }

        FIRAuth.auth()?.signIn(withEmail: UsernameTextField.text!, password: PasswordTextField.text!, completion: {
            user, error in
            if error != nil {
                // TODO: Show alert incorrect password.
                
                // Password or email address not recognized?
                NSLog("debug Your password is incorrect.")
                return
            }
            // Successfully signed up. Go to main menu.
            
            // *****uncomment the NetworkingService method after you implement all the sign up methods,
            // as saving user info should be placed after the user successfully signed up using whatever method*****
            NetworkingService().saveUserInfo(user: FIRAuth.auth()!.currentUser!, email: self.UsernameTextField.text!)
            
            self.performSegue(withIdentifier: "SignedUpToMainMenu",sender: self)
            NSLog("debug Successful signed in.")
        })
    
    }
    
    @IBAction func RegisterButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignInToSignUp", sender: self)
    }
    
    @IBAction func ForgotPasswordTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignInToForgotPassword", sender: self)
    }
    
    @IBAction func FacebookSiginInButtonTapped(_ sender: FBSDKLoginButton) {
        let loginButton = FBSDKLoginButton()
//        loginButton.delegate = self.loginButton as! FBSDKLoginButtonDelegate!
        facebookFirebaseLogin()
    }
    
    @IBAction func GoogleSignInButtonTapped(_ sender: UIButton) {
        googleFirebaseLogin()
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
                // TODO: alert.
                NSLog(error.localizedDescription)
            } else if result!.isCancelled {
                // TODO: alert.
                NSLog("debug FBLogin cancelled")
            } else {
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseLogin(credential)
            }
            // Already signed in.
            if let user = FIRAuth.auth()?.currentUser {
                self.performSegue(withIdentifier: "SignedUpToMainMenu", sender: self)
            }
        })
    }
    
    // Firebase login for Google and FB login.
    func firebaseLogin(_ credential: FIRAuthCredential) {
        if let user = FIRAuth.auth()?.currentUser {
            user.link(with: credential) { (user, error) in
                if let error = error {
                    // TODO: alert.
                    NSLog(error.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "SignedUpToMainMenu", sender: self)
            }
        } else {
            FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                if let error = error {
                    // TODO: alert.
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
            // TODO: alert.
            NSLog(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                          accessToken: (authentication?.accessToken)!)
        firebaseLogin(credential)
    }

}
