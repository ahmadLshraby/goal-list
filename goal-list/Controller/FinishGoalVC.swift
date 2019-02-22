//
//  FinishGoalVC.swift
//  goal-list
//
//  Created by sHiKoOo on 2/22/19.
//  Copyright © 2019 sHiKoOo. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController {
    
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTxt: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    // to get data from CreateGoalVC (delegate)
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismissDetail()
    }
    
    @IBAction func createGoalBtn(_ sender: UIButton) {
        // pass data to core data Goal Model
    }
    
    
    
}
