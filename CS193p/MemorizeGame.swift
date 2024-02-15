//
//  MemorizeGame.swift
//  CS193p
//
//  Created by Kumaresh on 15/02/24.
//

import Foundation

struct MemorizeGame<CardConent> {
    var cards: Array<Card>
    
    func choose (card: Card){
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardConent
    }
}
