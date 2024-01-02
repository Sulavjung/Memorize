//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/27/23.
//

// This is just for the shake of having a push everyday on github.


import Foundation


struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    //This is example of function as types. Here we are getting ===function as type===. 
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        
        // add numberOfPairsOfCards x 2 cards.
        // We use _ inplace of the pairIndex as we are not using the pariIndex.
        //In Swift, we use _ to say don't care.
        for _ in 0..<numberOfPairOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: <#T##CardContent#>))
            cards.append(Card(content: <#T##CardContent#>))
        }
    }
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
