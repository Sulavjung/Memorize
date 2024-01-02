//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/27/23.
//  This is viewModel. This will have access to the Model.

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["🍅", "🥦", "🌽", "🍠", "🌶️", "🥔", "🍇", "🍈","🍉", "🍊", "🍋", "🍌", "🍍", "🍎", "🍏", "🍐", "🍑", "🍒","🥑", "🍓", "🥒", "🥬", "🍄", "🥥", "🥕"];
    
    @Published private var model: MemoryGame<String> = MemoryGame(numberOfPairOfCards: 14) { pairIndex in
        if emojis.indices.contains(pairIndex){
            return emojis[pairIndex]
        } else {
            return "|?";
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle(){
        model.shuffle();
    }
    
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
