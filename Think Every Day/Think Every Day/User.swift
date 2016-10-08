//
//  User.swift
//  Think Every Day
//
//  Created by Ke Sheng on 10/7/16.
//  Copyright © 2016 TED. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct User {
    
    var username: String!
    var email: String!
    var ref: FIRDatabaseReference?
    var key: String
    
    init(snapshot: FIRDataSnapshot) {
        
        key = snapshot.key
        email = snapshot.value as! String
        ref = snapshot.ref
        
    }
    
    
    
    
    
    
}
