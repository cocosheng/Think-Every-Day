//
//  ViewController.swift
//  Think Every Day
//
//  Created by Mercy on 10/2/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Go to signIn page when user not signed in.
    override func viewDidAppear(_ animated: Bool) {
        // If user not signed in.
        
        // TODO: Check user signed in boolean.
        if (false) {
            self.performSegue(withIdentifier: "signIn", sender:self);
        }
        self.performSegue(withIdentifier: "mainMenu", sender: self);
    }

}
