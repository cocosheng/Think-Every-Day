//
//  AnswerHistoryTableViewController.swift
//  Think Every Day
//
//  Created by Mercy on 10/18/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

class QuestionsAnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answer: UILabel!
}

class AnswerHistoryTableViewController: UITableViewController {
    // TODO: placeholder data.
    var question = ["Q 1", "Q 2", "Q 3"]
    var answer = ["A 1", "A 2", "A 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Answer History"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionsAnswerCell", for: indexPath) as! QuestionsAnswerTableViewCell
        let questionContent = question[indexPath.row]
        let answerContent = answer[indexPath.row]
        cell.question?.text = questionContent
        cell.answer?.text = answerContent
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
