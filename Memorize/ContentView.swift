//
//  ContentView.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/22/23.
//



import SwiftUI
import SwiftData

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    let emojis = ["😀", "😃", "😍", "🤪", "🥰", "😉", "😀", "😃", "😍", "🤪", "🥰", "😉"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        
            ScrollView {
                Cards
            }
        .padding()
        
    }

    var Cards: some View {

        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]){
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
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
