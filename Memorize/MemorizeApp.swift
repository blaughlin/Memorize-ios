//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Bernard Laughlin on 6/23/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
