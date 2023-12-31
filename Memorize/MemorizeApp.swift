//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/22/23.
//

import SwiftUI
import SwiftData

@main
struct MemorizeApp: App {
    //We use @stateObject to make something as true. 
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
