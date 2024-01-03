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
        
        
        for pairIndex in 0..<max(2, numberOfPairOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a" ))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b" ))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else {
                return nil
            }
        }
        set {
            for index in cards.indices {
                if index == newValue{
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }
            
        }
    }
    
    //Here we changed the logic to find card in cards.
    //NOw working on the game logic.
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }){
            if(!cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched){
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    indexOfTheOneAndOnlyFaceUpCard = nil
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                
                
                cards[chosenIndex].isFaceUp = true;
            }
            
            
            
        }
    }
    
    
    
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: String
        
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "UP" : "Down") \(isMatched ? "Matched" : "")"
        }

    }
}
