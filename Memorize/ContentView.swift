//
//  ContentView.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/22/23.
//



import SwiftUI
import SwiftData

struct ContentView: View {
    let emojis = ["😀", "😃", "😍", "🤪", "🥰", "😉"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack {
            Cards
            cardCountAdjusters
        }
        .padding()
        
    }

    var Cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
            
        }
        .imageScale(.large)
    }
    
    // ==== func in SwiftUI ====
    // This is all about func and how do we define a func in swift. Here is a perfect example of that.
    // We refactored the previous code of creating the cardCound incrementor and decrementor with this one function. This will allow us to create same thing but in smart way.
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)          // This is to make sure that the overflow doesn't happen in array.
    }

    var cardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjusters(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else {
                base.fill()
            }
        }
        .onTapGesture{
            isFaceUp.toggle();
        }
    }
}















#Preview {
    ContentView()
}
