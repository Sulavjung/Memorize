//
//  ContentView.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/22/23.
//



import SwiftUI
import SwiftData

struct ContentView: View {
    //====Creating array in the Swift====
    //You can use let emojis: Array<String> = [] or you can also use let emojis: [String][] or you can just allow inference to take care of it by using it like below. 
    let emojis = ["😀", "😃", "😍", "🤪", "🥰", "😉"]
    
    var body: some View {
        HStack {
            CardView(content: emojis[0], isFaceUp: true)
            CardView(content: emojis[1], isFaceUp: true)
            CardView(content: emojis[2], isFaceUp: true)
            CardView(content: emojis[3], isFaceUp: true)
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
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
