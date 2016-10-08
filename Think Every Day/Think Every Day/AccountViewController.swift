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
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    var storageRef: FIRStorageReference! {
        return FIRStorage.storage().reference()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let user = FIRAuth.auth()?.currentUser!
        self.usernameLabel.text = user?.email!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // user info example: https://firebase.google.com/docs/auth/ios/manage-users
//    if let user = FIRAuth.auth()?.currentUser {
//        let name = user.displayName
//        let email = user.email
//        let photoUrl = user.photoURL
//        let uid = user.uid;  // The user's ID, unique to the Firebase project.
//        // Do NOT use this value to authenticate with
//        // your backend server, if you have one. Use
//        // getTokenWithCompletion:completion: instead.
//        // return
//    }
//    // No user is signed in.

    
    
    // TODO: Reset user password.
    
    // TODO: Reset user name.
    
    // TODO: Sign out when tap sign out..
    // try! FIRAuth.auth()!.signOut()
    
    // Currently do not support user email change.
    
    
}
