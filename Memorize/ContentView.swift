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
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            HStack {
                
                //====Button====
                //How to add button and interact thing. Also, you noticed that we created a variable with @State becuase we are changing the self which update the UI.
                //Here is one way:
                // Button("Add Card") {
                //  cardCount += 1;
                // }
                // Or,
                //In swift, button could be easily as complex thing you can imagine. Using the action and lablel of Button.
                Button(action: {
                    if cardCount > 1 {
                        cardCount -= 1;
                    }
                } , label: {
                    Image(systemName: "rectangle.stack.fill.badge.minus")
                } )
                Spacer()
                Button(action: {
                    if cardCount < emojis.count {
                        cardCount += 1;
                    }
                } , label: {
                    Image(systemName: "rectangle.stack.fill.badge.plus")
                } )
            }
            .imageScale(.large)
        }
        .padding()
        
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
