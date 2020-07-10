//
//  Card.swift
//  Concentration
//
//  Created by Aldrin Bahle Gama on 2020/07/02.
//  Copyright © 2020 Aldrin Bahle Gama. All rights reserved.
//

import Foundation

struct Card {
    
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var indentifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        indentifierFactory += 1
        return indentifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

}
