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
    
    private static var idFactory = 0
    
    init() {
        self.id = Card.getUniqueId()
    }
    
    private static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
}
