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
        
        // todo: do this for all users with all login methods
        
        databaseRef.child("users").child(user.uid).setValue(["email": email])
        databaseRef.child("users").child(user.uid).child("answers").setValue(["totalNumber": 0])
        databaseRef.child("users").child(user.uid).child("questions").setValue(["totalNumber": 0])
        databaseRef.child("users").child(user.uid).child("contributedQuestions").setValue(["totalNumber": 0])
        
    }
    
}
