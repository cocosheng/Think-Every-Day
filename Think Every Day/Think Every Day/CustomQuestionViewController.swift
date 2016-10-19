//
//  CustomQuestionViewController.swift
//  Think Every Day
//
//  Created by Ke Sheng on 10/7/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CustomQuestionViewController: UIViewController {
    
    
    @IBOutlet weak var ContentTextField: UITextField!
    @IBOutlet weak var InspirationTextField: UITextView!
    
    
    let user = FIRAuth.auth()?.currentUser!
    var isLibrary: Bool!
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAndAnwer(_ sender: UIButton) {
        
        // todo: implement islibrary or not
        // todo: debug the double segue problem
        
        let content = ContentTextField.text
        let inspiration = InspirationTextField.text
        
        isLibrary = false
        
        // isLibrary is true if current user is developer, else set by user
        
        if (content != "" && inspiration != "") {
            saveQuestion(content: content, inspiration: inspiration, userID: FIRAuth.auth()!.currentUser!.uid, enterLibrary: true)
            self.performSegue(withIdentifier: "didCreateCustomQuestion", sender: self)
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
