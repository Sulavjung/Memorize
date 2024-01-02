//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/27/23.
//

// This is just for the shake of having a push everyday on github.


import Foundation

//Adding where is we care a little.
struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    //This is example of function as types. Here we are getting ===function as type===. 
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        
        // add numberOfPairsOfCards x 2 cards.
        // We use _ inplace of the pairIndex as we are not using the pariIndex.
        //In Swift, we use _ to say don't care.
        for pairIndex in 0..<max(2, numberOfPairOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a" ))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b" ))
        }
    }
    
    mutating func choose(card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle();
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 //FIXME: bogus!
    }
    
    //self is immutable. Self shouldn't change the model. So, we need to use the mutating to make use aware that we are doing it intentionally.
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
        var id: String
        
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "UP" : "Down") \(isMatched ? "Matched" : "")"
        }

    }
}
