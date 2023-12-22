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
    
    var body: some View {
        HStack {
            
            //====The Use of the ForEach in Swift.====
            //The first argument in the range.
            //Second argument si the id: \.self for now. We will look into it later on deeply.
            // Then you have index in inside the curly braces.
            //ForEach view is very important when we are animating later on. The reason being is that, it keep tracks of the different things moving around nicely.
            
            //This is one way of using this is: ForEach(0..<4, id: \.self) { index in  STATEMENTS }
            //Or you could do in the way below.
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .padding()
        .foregroundColor(.orange)
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
