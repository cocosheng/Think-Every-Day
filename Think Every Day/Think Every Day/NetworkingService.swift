//
//  NetworkingService.swift
//  Think Every Day
//
//  Created by Ke Sheng on 10/7/16.
//  Copyright © 2016 TED. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage // for user image


struct NetworkingService {
    
    let databaseRef = FIRDatabase.database().reference()
    // let storageRef = FIRStorage.storage().reference()
    
    func saveUserInfo(user: FIRUser, email: String) {
        
        databaseRef.child("users").child(user.uid).setValue(["email": email])
        
    }
    
}
