//
//  GoalsVC.swift
//  goal-list
//
//  Created by sHiKoOo on 2/21/19.
//  Copyright © 2019 sHiKoOo. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var goals: [Goal] = []   // to hold the fetched data from core data Goal Model as the fetched data come as array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)// as we want it every time the view appear as viewDidLoad we get it only one time
        self.fetch { (success) in
            if success {
                if self.goals.count >= 1 {
                    self.tableView.isHidden = false
                }else {
                    self.tableView.isHidden = true
                }
                self.tableView.reloadData()
            }else {
                return
            }
        }
    }

    @IBAction func addGoalBtn(_ sender: UIButton) {
        if let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") as? CreateGoalVC {
            presentDetail(createGoalVC)
        }else { return }
    }
    
    
    
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    // get from core data Goal Model
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell {
            let goal = goals[indexPath.row] // get data from every index in the array
            cell.configureCell(goal: goal)
            return cell
        }else {
            return UITableViewCell()
        }
    }
}

// MARK: Fetch data from core data Goal Model
extension GoalsVC {
    
    func fetch(handler: @escaping(_ success: Bool) -> Void) {
        // get managed object context
        if let managedContext = appDelegate?.persistentContainer.viewContext {
            // fetch request from out entity
            let fetchRequest: NSFetchRequest<Goal> = Goal.fetchRequest()
            do {
                goals = try managedContext.fetch(fetchRequest)   // fetched data as [] and we can hold it in an empty array we created above
                handler(true)
            }catch {
                print(error.localizedDescription)
                handler(false)
            }
        }else { return }
    }
}
