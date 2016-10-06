//
//  CreateCustomQuestionViewController.swift
//  Think Every Day
//
//  Created by Ke Sheng on 10/5/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit
import Firebase

class CreateCustomQuestionViewController: UIViewController {
    
    var CQContent: String!
    var CQInspiration: String?
    
    

    @IBOutlet weak var CreateCQContentTextField: UITextField!
    @IBOutlet weak var CreateCQInspirationTextField: UITextView!
    
    // want to dismiss keyboard after press enter on keyboard, but does not work
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        CreateCQContentTextField.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didFinishCreateCustomQuestion(_ sender: UIButton) {
        // [START create_database_reference]
        
        // [END create_database_reference]
        
        
        
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
