//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/27/23.
//  This is viewModel. This will have access to the Model.

import SwiftUI

class EmojiMemoryGame {
    
    private static let emojis = ["😀", "😃", "😍", "🤪", "🥰", "😉", "😀", "😃", "😍", "🤪", "🥰", "😉"];
    
    private var model: MemoryGame<String> = MemoryGame(numberOfPairOfCards: 16) { pairIndex in
        if emojis.indices.contains(pairIndex){
            return ["😀", "😃", "😍", "🤪", "🥰", "😉", "😀", "😃", "😍", "🤪", "🥰", "😉"][pairIndex]
        } else {
            return "|?";
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
