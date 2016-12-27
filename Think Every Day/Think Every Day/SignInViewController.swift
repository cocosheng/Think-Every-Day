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

class SignInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{
//,FBSDKLoginButtonDelegate {

    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var appIconMainMenu: UIImageView!
    
    @IBOutlet weak var facebookSignInButton: FBSDKLoginButton!
    
    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        self.appIconMainMenu.image = #imageLiteral(resourceName: "AppIconMainMenu")
        
        if let user = FIRAuth.auth()?.currentUser{
            NSLog("debug user is logged in")
        } else {
            NSLog("debug user is logged out")
        }
//        let facebookSignInButton = FBSDKLoginButton()
//        facebookSignInButton.delegate = self
        // TODO: customize Google sign-in button.
        
        // TODO: customize FB sign-in button.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignInButtonTapped(_ sender: UIButton) {
        NSLog("debug sign in tapped")
        if UsernameTextField.text == "" {
            self.showErrorAlert(errorTitle: "Sign in unsuccessful", errorMessage: "Email address cannot be empty.")
            NSLog("debug Email address cannot be empty")
            return
        } else if PasswordTextField.text == "" {
            self.showErrorAlert(errorTitle: "Sign in unsuccessful", errorMessage: "Password cannot be empty.")
            NSLog("debug Password cannot be empty.")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: UsernameTextField.text!, password: PasswordTextField.text!, completion: {
            user, error in
            if error != nil {
                // Password or email address not recognized.
                self.showErrorAlert(errorTitle: "Sign in unsuccessful", errorMessage: error as! String!)
                NSLog("debug Your password is incorrect.")
                return
            }
            // Successfully signed up. Go to main menu.
            
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
        facebookFirebaseLogin()
    }
    
    @IBAction func GoogleSignInButtonTapped(_ sender: GIDSignInButton) {
        googleFirebaseLogin()
    }
    
    func googleFirebaseLogin() {
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signIn() // signInSilently()
    }
    
    func facebookFirebaseLogin() {
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["email"], from: self, handler: { (result, error) in
            if let error = error {
                self.showErrorAlert(errorTitle: "Facebook sign in unsuccessful", errorMessage: error.localizedDescription as! String!)
                NSLog("debug "+error.localizedDescription)
            } else if result!.isCancelled {
                self.showErrorAlert(errorTitle: "Facebook sign in unsuccessful", errorMessage: "Facebook sign in is cancelled.")
                NSLog("debug FBLogin cancelled")
            } else {
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseLogin(credential)
            }
            // Already signed in.
            if let user = FIRAuth.auth()?.currentUser {
                self.performSegue(withIdentifier: "SignedUpToMainMenu", sender: self)
                return
            }
            self.showErrorAlert(errorTitle: "Facebook sign in unsuccessful", errorMessage: "Facebook sign in cannot be completed.")
            NSLog("debug Facebook Sign In cannot be completed.")
        })
    }
    
    // Firebase login for Google and FB login.
    func firebaseLogin(_ credential: FIRAuthCredential) {
        // Already signed in.
        if let user = FIRAuth.auth()?.currentUser {
            user.link(with: credential) { (user, error) in
                if let error = error {
                    self.showErrorAlert(errorTitle: "Sign in unsuccessful", errorMessage: error.localizedDescription as! String!)
                    NSLog("debug "+error.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "SignedUpToMainMenu", sender: self)
            }
        } else {
            FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                if let error = error {
                    self.showErrorAlert(errorTitle: "Sign in unsuccessful", errorMessage: error.localizedDescription as! String!)
                    NSLog("debug "+error.localizedDescription)
                    return
                }
                
                // TODO: for fb sign in saveUserInfo.
                if user?.email != nil {
                    NetworkingService().saveUserInfo(user: FIRAuth.auth()!.currentUser!, email: (user?.email)!)
                }
                
                self.performSegue(withIdentifier: "SignedUpToMainMenu", sender: self)
            }
        }
    }
    
//    //Facebook sign in Delegate function.
//    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error?) {
//        NSLog("debug facebook loginButton called")
//        if let error = error {
//            NSLog("debug facebook" + error.localizedDescription)
//            return
//        }
//        NSLog("debug facebook loginButton function called")
//    }
//    
//    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//    }

    
    // GIDSignInDelegate function. For Google Signin.
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            self.showErrorAlert(errorTitle: "Google sign in unsuccessful", errorMessage: error.localizedDescription as! String!)
            NSLog("debug " + error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                          accessToken: (authentication?.accessToken)!)
        firebaseLogin(credential)
    }
    
}
