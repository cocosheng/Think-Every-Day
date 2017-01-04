//
//  Utilities.swift
//  Think Every Day
//
//  Created by Mercy on 10/2/16.
//  Copyright © 2016 TED. All rights reserved.
//

//  This class provides new UIViewController functions that might be used throughout the app.
import UIKit

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
    func showChangeContentAlert(alertTitle: String!, alertMessage: String!, textFieldPlaceholder: String!, errorMessage: String!) -> UIAlertController {
        let alertController = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: UIAlertControllerStyle.alert)
        
        // Check whether textField is empty. If empty, show alert to ask user input again.
        let okAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: { (_) -> Void in
            let textfield = alertController.textFields!.first!
            if (textfield.text?.isEmpty)! {
                self.showErrorAlert(errorTitle: "Reset unsuccessful", errorMessage: errorMessage)
            }
        })
        
        alertController.addTextField {(txtPassword) -> Void in txtPassword.placeholder = textFieldPlaceholder
        }
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        return alertController
    }
}
