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
    
    
    
    // TODO: update after implementing Field, Answer, Tag class
    // TODO: implement go into library choice
    
    
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
        // let newQuestionRef = databaseRef.child("questions").childByAutoId()
        
        let content = ContentTextField.text
        let inspiration = InspirationTextField.text
        
        isLibrary = false
        
        // isLibrary is true if current user is developer, else set by user
        
        if (content != "" && inspiration != "") {

            // let newQuestion = Question(content: content, inspiration: inspiration, userID: user!.uid, isLibrary: isLibrary, upVote: 0, downVote: 0, alreadyPosted: false)
        
            // newQuestionRef.setValue(newQuestion.toAnyObject())
            // self.performSegue(withIdentifier: "didCreateCustomQuestion",sender: self)
        }
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
