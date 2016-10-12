//
//  AccountViewController.swift
//  Think Every Day
//
//  Created by Mercy on 10/3/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class AccountViewController: UIViewController {
    // Currently do not support user email change.
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var logOutButton: UIButton!
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    var storageRef: FIRStorageReference! {
        return FIRStorage.storage().reference()
    }

    // user info example: https://firebase.google.com/docs/auth/ios/manage-users
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = FIRAuth.auth()?.currentUser!
        self.usernameLabel.text = user?.email!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        try! FIRAuth.auth()!.signOut()
        GIDSignIn.sharedInstance().signOut()
        self.performSegue(withIdentifier: "logOutToSignIn", sender: self)
    }
    
    // TODO: Reset user password.
    
    // TODO: Reset user name.
    
    
    
}
