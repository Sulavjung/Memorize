//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/27/23.
//

import Foundation


struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
