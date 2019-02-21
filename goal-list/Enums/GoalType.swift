//
//  GoalType.swift
//  goal-list
//
//  Created by sHiKoOo on 2/21/19.
//  Copyright © 2019 sHiKoOo. All rights reserved.
//

import Foundation

// give it a type as when we call it in configure cell we need it as String so we can write .type instead of GoalType.type
enum GoalType: String {
    case longTerm = "Long Term"
    case shortTerm = "Short Term"
}
