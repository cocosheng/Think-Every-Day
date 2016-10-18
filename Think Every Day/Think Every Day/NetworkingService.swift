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
        databaseRef.child("users").child(user.uid).child("answers").setValue(["totalNumber": 0])
        databaseRef.child("users").child(user.uid).child("questions").setValue(["totalNumber": 0])
        databaseRef.child("users").child(user.uid).child("contributedQuestions").setValue(["totalNumber": 0])
        
    }
    
    func saveQuestion(content: String!, inspiration: String!, userID: String!, enterLibrary: Bool!) {
        
        // initialize all variables
        // update user side (question/answer/contributedQ)
        
        let key = databaseRef.child("questions").childByAutoId().key
        let question = ["content": content,
                    "inspiration": inspiration,
                    "createdByUser": userID,
                    "isLibrary": enterLibrary,
                    "upVote": 0,
                    "downVote": 0,
                    "alreadyPosted": false] as [String : Any]
        let childUpdates = ["/questions/\(key)": question]
        databaseRef.updateChildValues(childUpdates)
        databaseRef.child("questions").child(key).child("answers").setValue(["totalNumber": 0])
        databaseRef.child("questions").child(key).child("tags").setValue(["totalNumber": 0])
        // todo: update tags/fields adding
        databaseRef.child("questions").child(key).child("fields").setValue(["totalNumber": 0])
        
        // update user side, need to debug
//        databaseRef.child("users").child(userID).child("contributedQuestions").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            let currentNumContributedQ = value?["totalNumber"] as! Int
//            snapshot.setValue(currentNumContributedQ + 1, forKey: "totalNumber")
//            snapshot.setValue(key, forKey: "\(currentNumContributedQ + 1)")
//        }) { (error) in
//            print(error.localizedDescription)
//        }
    }
    
}
