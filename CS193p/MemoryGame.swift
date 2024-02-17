//
//  MemorizeGame.swift
//  CS193p
//
//  Created by Kumaresh on 15/02/24.
//

import Foundation


struct MemoryGame<CardConent> {
    private (set) var cards: Array<Card>
    
    init(numberOfPairsOfCards : Int, cardContentFactory:(Int)-> CardConent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
            
        }
    }
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    func choose (card: Card){
       
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        var content: CardConent
    }
}
