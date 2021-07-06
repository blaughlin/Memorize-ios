//
//  MemoryGame.swift
//  Memorize
//
//  Created by Bernard Laughlin on 7/2/21.
//

//Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private(set) var score = 0
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    private(set) var alreadySeen: Array<Card> = []
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {

            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for card in alreadySeen {
                    if card.id == cards[chosenIndex].id {
                        score = score - 1
                        print(alreadySeen)
                        break
                   }
                }
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
            alreadySeen.append(cards[chosenIndex])
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCard x2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards = cards.shuffled()
    }
        
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched : Bool = false
        var content: CardContent
        var id: Int
    }
}
