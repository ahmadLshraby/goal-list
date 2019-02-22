//
//  FinishGoalVC.swift
//  goal-list
//
//  Created by sHiKoOo on 2/22/19.
//  Copyright © 2019 sHiKoOo. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController {
    
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTxt: UITextField!
    
    // to hold passed data
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
        if pointsTxt.text != "" {
            self.save { (success) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func save(handler: @escaping(_ success: Bool) -> Void) {
        // get managed object context
        if let managedContext = appDelegate?.persistentContainer.viewContext {
            // instance from Goal Model and create a persistent storage coordinator
            let goal = Goal(context: managedContext)
            // set up the Model
            goal.goalDescription = goalDescription
            goal.goalType = goalType.rawValue
            goal.goalCompletionValue = Int32(pointsTxt.text!)!
            goal.goalProgress = Int32(0)
            // pass data to persistent storage
            do {
            try managedContext.save()
                handler(true)
            }catch {
                print(error.localizedDescription)
                handler(false)
            }
        }else { return }
    }
    
}
