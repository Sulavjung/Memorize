//
//  ContentView.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/22/23.
//



import SwiftUI
import SwiftData

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame 
    
    
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack {
            ScrollView {
                Cards
                    .animation(.default, value: viewModel.cards)
            }
            .padding()
            
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
    }

    var Cards: some View {

        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.green)
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill(.green).opacity(card.isFaceUp ? 0: 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
    }
}















#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
