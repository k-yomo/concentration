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
    var id: Int
    
    static var idFactory = 0
    
    init() {
        self.id = Card.getUniqueId()
    }
    
    static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
}
