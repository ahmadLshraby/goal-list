//
//  CreateGoalVC.swift
//  goal-list
//
//  Created by sHiKoOo on 2/22/19.
//  Copyright © 2019 sHiKoOo. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTxt: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm     //  to start the app with default value and can change it
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectColor()
        goalTxt.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTxt.text = ""
        goalTxt.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismissDetail()
    }
    
    @IBAction func shortTermBtn(_ sender: UIButton) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectColor()
    }
    
    @IBAction func longTermBtn(_ sender: UIButton) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectColor()
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        if goalTxt.text != "" && goalTxt.text != "What is your goal ?"{
            if let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC {
                // pass the data from CreateGoalVC to FinishGoalVC
                finishGoalVC.initData(description: goalTxt.text, type: goalType)
                presentingViewController?.presentSecondDetail(finishGoalVC)
            }else { return }
        }
    }
    

}
