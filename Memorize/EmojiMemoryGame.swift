//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/27/23.
//  This is viewModel. This will have access to the Model.

import SwiftUI

//This is the function that we are passing as the ===Function as Type===
//We changed this to have a closure syntax to do the same.
//func createCardContent(forPairAtIndex index: Int) -> String {
//    return ["😀", "😃", "😍", "🤪", "🥰", "😉", "😀", "😃", "😍", "🤪", "🥰", "😉"][index]
//}

//This has to be class because it has to be shared among many other.
class EmojiMemoryGame {
    //We can't have let emoji = ["😀", "😃", "😍", "🤪", "🥰", "😉", "😀", "😃", "😍", "🤪", "🥰", "😉"] here as this is initializer variable.
    //The initializer vairable isn't initialized in known order. So, we could either can make this global variable or, we could do this:
    // We could do this alone and that will solve the problem. static let emojis = ["😀", "😃", "😍", "🤪", "🥰", "😉", "😀", "😃", "😍", "🤪", "🥰", "😉"]; OR,
    //We can have this which ensure that we are the only one using this.
    
    private static let emojis = ["😀", "😃", "😍", "🤪", "🥰", "😉", "😀", "😃", "😍", "🤪", "🥰", "😉"];
    
    private var model: MemoryGame<String> = MemoryGame(numberOfPairOfCards: 4) { pairIndex in
            return ["😀", "😃", "😍", "🤪", "🥰", "😉", "😀", "😃", "😍", "🤪", "🥰", "😉"][pairIndex]
        }                 //We are changing this to have the closure syntax.
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
