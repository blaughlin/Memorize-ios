//
//  ContentView.swift
//  Memorize
//
//  Created by Bernard Laughlin on 6/23/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack{
            HStack{
                Text("Theme:")
                Text(EmojiMemoryGame.currentTheme.name)
            }
            Text("Score: \(viewModel.score)")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards){card in
                        CardView(card: card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(EmojiMemoryGame.currentTheme.color)
            Spacer()
            HStack{
            }
            .padding(.horizontal)
            Button(action: {viewModel.changeTheme()}, label: {Text("New Game")})

        }
        .padding(.horizontal)
        .font(.largeTitle)
    }

}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(EmojiMemoryGame.currentTheme.color)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}



