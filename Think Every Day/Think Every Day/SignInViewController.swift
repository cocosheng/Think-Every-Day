//
//  SignInViewController.swift
//  Think Every Day
//
//  Created by Mercy on 10/3/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

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

    @IBAction func SignInButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil);
        // Change isSignedIn bool to true.
    }

}
