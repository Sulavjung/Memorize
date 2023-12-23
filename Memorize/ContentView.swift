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
            Spacer()
            cardCountAdjusters
        }
        .padding()
        
    }

    var Cards: some View {

        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
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

    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
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
            
            // ====Opacity vs if-else ====
            // when we use if-else, once the whole row of card is face up, it is collapsing to having no height to minimum height as we only have base.fill.
            //To overcome that, we would want to make the rounded rectange opacity to change rather than deleting the whole thing.
            //Here is the example of how we are changing this if code to what we want.
            // if isFaceUp {
            //     base.fill(.white)
            //     base.strokeBorder(lineWidth: 2)
            //     Text(content).font(.largeTitle)
            // }else {
            //   base.fill()
            // }
            
            //Also, the reason we are using the Group here is because the if doesn't allow us to do the opacity. So, we get the view from the group of things so that
            //we could set the opacity according to the faceUp value.
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill(.orange).opacity(isFaceUp ? 0: 1)
        }
        .onTapGesture{
            isFaceUp.toggle();
        }
    }
}















#Preview {
    ContentView()
}
