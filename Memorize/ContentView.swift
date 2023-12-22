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
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    var body: some View {
        
        
        //====ViewBuilder==== can have variables. It can only have list, local variables, and conditionals.
        //====let vs var: ==== var base: RoundedRectangle = RoundedRectangle(cornerRadius: 12) -> We never say this: Because var means it will change but we will never change this variable. So, we will use let. So, we mostly only use let in viewBuilder.
        //====Type Inference: ===== let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12) -> So, we dont do this either even when it is correct. The reason, we let swift decide to infer what it is. Swift can tell what it is seing what it is returning. Since, RoundedRectangel returns just RoundedRectange, the swift auto infer the variable to be the RoundedRectangle.
        //We do similar thing to the above isFaceUp. We can remove the : Bool.
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }else {
                base.fill()
            }
        }
        .onTapGesture{
            //We can't do isFaceUp = !isFaceUp alone becuase self is immutable. So, we have to add @State to var isFaceUp.
            //What the ====@State==== Does then? -> The state creates a pointer to the memory that hold the isFaceUp.
            //So we could also do isFaceUp.toggle() which is available for the Bool struct in swift.
            isFaceUp.toggle();
        }
    }
}















#Preview {
    ContentView()
}
