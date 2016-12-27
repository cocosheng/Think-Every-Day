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
}
