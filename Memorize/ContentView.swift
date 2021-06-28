//
//  ContentView.swift
//  Memorize
//
//  Created by Bernard Laughlin on 6/23/21.
//

import SwiftUI

struct ContentView: View {
    var transportationEmojis = ["🚗","✈️","🛵","🚁","🚑","🚒","🚔","🚞"]
    var foodEmojis = ["🍎","🍉","🍇","🍆","🥑","🍕","🍔","🌯"]
    var animalEmojis = ["🐶","🐧","🐷","🦄","🐤","🦊","🦦","🦈"]
    
    
    @State var currentEmojis = ["🍎","🍉","🍇","🍆","🥑","🍕","🍔","🌯"]
    @State var emojiCount = 6
    var body: some View {
        VStack{
            Text("Memorize")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(currentEmojis[0..<currentEmojis.count], id: \.self){emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3,contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
//            remove
            transporation
            Spacer()
            food
            Spacer()
            animals
//            add
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .font(.largeTitle)
    }
//        var remove: some View {
//            Button{
//                if emojiCount > 1 {
//                    emojiCount -= 1
//                }
//            } label: {
//                Image(systemName: "minus.circle")
//            }
//        }
//
//    var add: some View {
//        Button {
//            if emojiCount < foodEmojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }

    var food: some View {
        Button {
            currentEmojis = foodEmojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "applelogo")
                Text("Food")
                    .font(.footnote)
                    .padding(.bottom)
            }
        }
    }
    
    var animals: some View {
        Button {
            currentEmojis = animalEmojis.shuffled()
        } label: {
            VStack{
                Image(systemName: "hare")
                Text("Animals").font(.footnote).padding(.bottom)
            }
        }
    }
    
    var transporation: some View {
        Button {
            currentEmojis = transportationEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "bicycle")
                Text("Vehicles").font(.footnote).padding(.bottom)
                
            }
        }
    }
    
    
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}



