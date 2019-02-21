//
//  GoalsVC.swift
//  goal-list
//
//  Created by sHiKoOo on 2/21/19.
//  Copyright © 2019 sHiKoOo. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let goal = Goal()    // instance of core data Model
        
    }

    @IBAction func addGoalBtn(_ sender: UIButton) {
    }
    
}

