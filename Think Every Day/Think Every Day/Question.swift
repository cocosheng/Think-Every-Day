//
//  Question.swift
//  Think Every Day
//
//  Created by Ke Sheng on 10/7/16.
//  Copyright © 2016 TED. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Question {
    
    // TODO: implement Field, Tag, and Answer class
    
    var content: String!
    var inspiration: String!
    // var fields: Array<Field>!
    var userID: String!
    // var tags: Array<Tag>!
    // var answers: Array<Answer>!
    var upVote: Int!
    var downVote: Int!
    var key: String!
    var ref: FIRDatabaseReference?
    var isLibrary: Bool!
    var alreadyPosted: Bool!
    var goIntoLibrary: Bool!
    

    init(content: String!, inspiration: String!, userID: String!, goIntoLibrary: Bool!) {
       
        self.content = content
        self.inspiration = inspiration
        // self.fields = fields
        self.userID = userID
        if (userID == "developer" || goIntoLibrary) {self.isLibrary = true} else {self.isLibrary = false}
        // self.tags = tags
        self.upVote = 0
        self.downVote = 0
        self.alreadyPosted = false
        self.goIntoLibrary = goIntoLibrary
        self.ref = FIRDatabase.database().reference()
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        
        let snapshotValue = snapshot.value as! NSDictionary
        
        self.content = snapshotValue["content"] as! String
        self.inspiration = snapshotValue["inspiration"] as! String
        // self.fields = snapshotValue["fields"] as! Array<Field>
        self.userID = snapshotValue["userID"] as! String
        self.isLibrary = snapshotValue["isLibrary"] as! Bool
        // self.tags = snapshotValue["tags"] as! Array<Tag>
        // self.answers = snapshotValue["answers] as! Array<Answer>
        self.upVote = snapshotValue["upVote"] as! Int
        self.downVote = snapshotValue["downVote"] as! Int
        self.alreadyPosted = snapshotValue["alreadyPosted"] as! Bool!
        self.goIntoLibrary = snapshotValue["goIntoLibrary"] as! Bool!
        self.key = snapshot.key
        self.ref = snapshot.ref
        
    }
    
    func toAnyObject() -> [String: AnyObject] {
        return ["content": content as AnyObject, "inspiration": inspiration as AnyObject, "userID" : userID as AnyObject, "goIntoLibrary": goIntoLibrary as AnyObject, ]
    }
    
    
}
