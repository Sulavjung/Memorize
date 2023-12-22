//
//  ContentView.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/22/23.
//



import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: 12)
        }
    }
}















#Preview {
    ContentView()
}
