//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bernard Laughlin on 7/2/21.
//
// View Model

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    struct Theme {
        var emojis: Array<String> = ["🍎","🍉","🍇","🍆","🥑","🍕","🍔","🌯"]
        var color: Color?
        var numberCards: Int = 8
        var name: String = "Emoji"
    }

    static let foodTheme = Theme(emojis: ["🍎","🍉","🍇","🍆","🥑","🍕","🍔","🌯"].shuffled(), color: Color.orange, numberCards: 20, name: "Food")
    static let transporationTheme = Theme(emojis: ["🚗","✈️","🛵","🚁","🚑","🚒","🚔","🚞"].shuffled(), color: Color.red, numberCards: 8, name: "Transportation")
    static let animalTheme = Theme(emojis: ["🐶","🐧","🐷","🦄","🐤","🦊","🦦","🦈"].shuffled(), color: Color.yellow, numberCards: 8, name: "Animals")
    static let halloweenTheme = Theme(emojis: ["👻","🦇","🎃","👹","😈"].shuffled(), color: Color.gray, numberCards: 5, name: "Halloween" )
    static let sportTheme = Theme(emojis: ["⚽️","🏀","🏈","🎱","🛼"].shuffled(), color: Color.blue, numberCards: 5, name: "Sports" )
    static let plantTheme = Theme(emojis: ["🌲","🌵","🍄","🌼","🌹","🌿","🍁","🌴"].shuffled(), color: Color.green, numberCards: 8, name: "plants" )



    
    static let availableThemes : Array<Theme> = [foodTheme, transporationTheme, animalTheme, halloweenTheme, sportTheme, plantTheme]
    static var currentTheme: Theme = availableThemes.randomElement()!
    
    static func createMemoryGame() -> MemoryGame<String> {
        currentTheme = availableThemes.randomElement()!
        var cardNumber = 0
        if currentTheme.numberCards > currentTheme.emojis.count {
            cardNumber = currentTheme.emojis.count
        } else {
            cardNumber = currentTheme.numberCards
        }
        return MemoryGame<String>( numberOfPairsOfCards: cardNumber) { pairIndex in currentTheme.emojis[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    var score: Int {
        model.score
    }
    // Mark: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func changeTheme() -> () {
        model  = EmojiMemoryGame.createMemoryGame()
    }
    
}

