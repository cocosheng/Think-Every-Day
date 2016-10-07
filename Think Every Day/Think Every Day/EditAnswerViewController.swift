//
//  EditAnswerViewController.swift
//  Think Every Day
//
<<<<<<< Updated upstream
//  Created by Ke Sheng on 10/5/16.
=======
<<<<<<< HEAD
//  Created by Ke Sheng on 10/7/16.
=======
//  Created by Ke Sheng on 10/5/16.
>>>>>>> origin/master
>>>>>>> Stashed changes
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

class EditAnswerViewController: UIViewController {
<<<<<<< Updated upstream
=======
<<<<<<< HEAD

    override func viewDidLoad() {
        super.viewDidLoad()

=======
>>>>>>> Stashed changes
    
    var submitted = false
    var savedForLaterEdit = false
    var isCurrentlyEditing = false
    var editSubmittedAnswer = false


    @IBOutlet weak var EditAnswerQuestionLabel: UILabel!

    @IBOutlet weak var EditAnswerInspirationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< Updated upstream
=======
>>>>>>> origin/master
>>>>>>> Stashed changes
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
>>>>>>> origin/master
>>>>>>> Stashed changes

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
