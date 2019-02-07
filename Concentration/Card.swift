//
//  Card.swift
//  Concentration
//
//  Created by Kanji Yomoda on 2019/02/06.
//  Copyright © 2019 Kanji Yomoda. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
