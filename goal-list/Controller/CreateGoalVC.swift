//
//  CreateGoalVC.swift
//  goal-list
//
//  Created by sHiKoOo on 2/22/19.
//  Copyright © 2019 sHiKoOo. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalTxt: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shortTermBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func longTermBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        
    }
    

}
