//
//  ViewController.swift
//  Concentration
//
//  Created by Aldrin Bahle Gama on 2020/06/28.
//  Copyright © 2020 Aldrin Bahle Gama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var emoji = [Int:String]()
    var emojiChoices = ["🎃","👻","🍎","💀","🥝","🐼","🍉","☠️","🍍","👽","🍇","🤡","🥭","😻","🍓","🤖"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons!")
        }
    }
    
    func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(game.flipCount)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5786727071, blue: 0, alpha: 0.2995772688) : #colorLiteral(red: 1, green: 0.5786727071, blue: 0, alpha: 1)
            }
            
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {

        if button.currentTitle == emoji {

            } else {

        }
        
    }
    
    @IBAction func newGame(_ sender: Any) {
        game.reset()
        emoji.removeAll()
        updateViewFromModel()
        
    }

}


