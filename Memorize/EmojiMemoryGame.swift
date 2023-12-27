//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/27/23.
//  This is viewModel. This will have access to the Model.

import SwiftUI

//This has to be class because it has to be shared among many other.
class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4);
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
