//
//  EditAnswerViewController.swift
//  Think Every Day
//
//  Created by Ke Sheng on 10/7/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

class EditAnswerViewController: UIViewController {
    
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var InspirationLabel: UILabel!

    @IBOutlet weak var AnswerTextField: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO: update question label and inspiration label
        // 1. today's question
    
        // 2. hot question
    
        // 3. custom question
    
    //TODO: create answer: content, question, userID, upVote, downVote, key, isAnonymous, isPrivate, tag
    
    //TODO: add answer to question, userID, tag

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
