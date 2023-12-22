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
    
    
    //====Implicit Return====
    //This isn't view builder but rather a function. If it is one line of code for function and computed properties, you don't need return before HStack becuase of ====Implicit Return====. 
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
    
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1;
            }
        } , label: {
            Image(systemName: "rectangle.stack.fill.badge.minus")
        } )
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1;
            }
        } , label: {
            Image(systemName: "rectangle.stack.fill.badge.plus")
        } )
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
