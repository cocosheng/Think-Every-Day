//
//  Utilities.swift
//  Think Every Day
//
//  Created by Mercy on 10/2/16.
//  Copyright © 2016 TED. All rights reserved.
//

//  This class provides new UIViewController functions that might be used throughout the app.
import UIKit
import FirebaseAuth

extension UIViewController {
    // Hide keyboard if user finishes typing and tap the screen.
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Show error alert.
    func showErrorAlert(errorTitle: String!, errorMessage: String!) {
        let myAlert = UIAlertView(title: errorTitle, message: errorMessage, delegate: nil, cancelButtonTitle: "Try Again")
        myAlert.show()
    }
    
    func showAlert(alertTitle: String!, alertMessage: String!, cancelButtonTitle: String!) {
        let myAlert = UIAlertView(title: alertTitle, message: alertMessage, delegate: nil, cancelButtonTitle: cancelButtonTitle)
        myAlert.show()
    }

    // Show alert with a text field for input.
    // If this function is called to reset User name, isResetUserName is set to 1.
    func showChangeContentAlert(alertTitle: String!, alertMessage: String!, textFieldPlaceholder: String!, errorMessage: String!, isResetUserName: Int) -> UIAlertController {
        let alertController = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: UIAlertControllerStyle.alert)
        
        // Check whether textField is empty. If empty, show alert to ask user input again.
        let okAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: { (_) -> Void in
            let textfield = alertController.textFields!.first!
            let textInput = textfield.text
            if (textInput?.isEmpty)! {
                self.showErrorAlert(errorTitle: "Reset unsuccessful", errorMessage: errorMessage)
            } else if (isResetUserName == 1) {
                // Check whether username is unchanged.
                // TODO: for fb logIn.
                if (FIRAuth.auth()?.currentUser!.email == nil) {
                    
                } else if (textInput == FIRAuth.auth()?.currentUser!.email) { // TODO: change to currentUser.username
                    self.showErrorAlert(errorTitle: "Reset unsuccessful", errorMessage: "Your new username cannot be your old username.")
                } //TODO: else if () {
                    // Check whether usename is used by other users.
                //}
                else { // Reset successful
                    self.showAlert(alertTitle: "Reset username", alertMessage: "Reset username successful.", cancelButtonTitle: "OK")
                    // TODO: reset username.
                }
            } else { // Reset Password.
                // Check whether password is unchanged.
                // TODO: for fb / google login.
                FIRAuth.auth()?.currentUser!.updatePassword(textInput!, completion: nil)
                // TODO: password textfield conceal.
            }
        })
        
        alertController.addTextField {(txtPassword) -> Void in txtPassword.placeholder = textFieldPlaceholder
        }
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        return alertController
    }
}
