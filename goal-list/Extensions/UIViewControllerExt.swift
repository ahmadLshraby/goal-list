//
//  UIViewControllerExt.swift
//  goal-list
//
//  Created by sHiKoOo on 2/22/19.
//  Copyright © 2019 sHiKoOo. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // animation to present VC instead of present(VC, animated: true, completion: nil)
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    // animation to dismiss VC instead of dismiss(animated: true, completion: nil)
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    // to dismiss the third layer of FinishGoalVC to the first one GoalsVC we need to dismiss the second when it pass data to the third
    func presentSecondDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        if let presentedVC = presentedViewController  {
            // dismiss the second , add the third , present the third so when the third is dismissed it goes to the firsts
            presentedVC.dismiss(animated: false) {
                self.view.window?.layer.add(transition, forKey: kCATransition)
                self.present(viewControllerToPresent, animated: false, completion: nil)
            }
        }else { return }
    }
    
}
