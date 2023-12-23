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
        
        //====LazyGrid====
        //It is something that we see here. LazyVGrid takes colums which takes array of GridItem. You can think of these as flex items.
        //So, you could do LazyVGrid(columns: [GridItem(), GridItem(), GridItem()] to have 3 items in each row and create 3 columns. And auto flex.
        //And there is another way to create something ismilar like the one that is being used below were we are telling the LazyVGrid that the the
        // GridItem that we want is adaptive and has minimum size of 120. Create each of those and fill that accordingly.
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
