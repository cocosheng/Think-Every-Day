//
//  EditAnswerViewController.swift
//  Think Every Day
//
//  Created by Ke Sheng on 10/5/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

class EditAnswerViewController: UIViewController {
    
    var submitted = false
    var savedForLaterEdit = false
    var isCurrentlyEditing = false
    var editSubmittedAnswer = false


    @IBOutlet weak var EditAnswerQuestionLabel: UILabel!

    @IBOutlet weak var EditAnswerInspirationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveForLaterEdit(_ sender: UIButton) {
        savedForLaterEdit = true
        isCurrentlyEditing = false
    }
    
    @IBAction func SubmitAnswer(_ sender: UIButton) {
        submitted = true
        savedForLaterEdit = false
        isCurrentlyEditing = false
    }
    
    @IBAction func EditAnswer(_ sender: UIButton) {
        if (submitted) {
            editSubmittedAnswer = true
            isCurrentlyEditing = true
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
