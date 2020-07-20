//
//  ViewController.swift
//  Concentration
//
//  Created by Aldrin Bahle Gama on 2020/06/28.
//  Copyright © 2020 Aldrin Bahle Gama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    var emoji = [Card:String]()
    //private var emojiChoices = ["🎃","👻","🍎","💀","🥝","🐼","🍉","☠️","🍍","👽","🍇","🤡","🥭","😻","🍓","🤖"]
    private var emojiChoices = "🎃👻🍎💀🥝🐼🍉☠️🍍👽🍇🤡🥭😻🍓🤖"
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons!")
        }
    }
    
    func updateViewFromModel() {
        updateFlipCountLabel()
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.07342789322, green: 0.2378379405, blue: 1, alpha: 0.251765839) : #colorLiteral(red: 0.07846749574, green: 0.1494457722, blue: 0.9816797376, alpha: 1)
            }
            
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .foregroundColor: UIColor.black,
        ]
        let attributedString = NSAttributedString(string: "Flips: \(game.flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
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

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


