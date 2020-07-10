//
//  Concentration.swift
//  Concentration
//
//  Created by Aldrin Bahle Gama on 2020/07/02.
//  Copyright © 2020 Aldrin Bahle Gama. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    private var witnessedCards = [Card]()
    
    private(set) var flipCount = 0
    
    var indexOfOneAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int)  {
        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            } else {
                for  flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //SHUFFLE THE CARDS
        var lastCardIndex = cards.count - 1;
        
        while lastCardIndex > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(lastCardIndex)))
            cards.swapAt(randomIndex, lastCardIndex)
            lastCardIndex -= 1
        }
    }
    
    func reset() {
        flipCount = 0
        for index in 0..<cards.count {
            cards[index].isFacedUp = false
            cards[index].isMatched = false
        }
        witnessedCards.removeAll()
    }
    
}
