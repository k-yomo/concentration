//
//  ViewController.swift
//  Concentration
//
//  Created by Kanji Yomoda on 2019/02/04.
//  Copyright © 2019 Kanji Yomoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var FlipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    private(set) var flipCount = 0 {
        didSet {
            FlipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    private var emojiChoisces: Array<String> = ["👻","🎃","🍭", "🦇", "🍎", "🙀", "🧛🏿‍♂️"]
    private var emoji = Dictionary<Int,String>()
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 0) : #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card.id] == nil, emojiChoisces.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoisces.count)))
            emoji[card.id] = emojiChoisces.remove(at: randomIndex)
        }
        return emoji[card.id] ?? "?"
    }
}

