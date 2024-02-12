//
//  SwiftUIView.swift
//  CS193p
//
//  Created by Kumaresh on 12/02/24.
//

import SwiftUI

struct SwiftUIView: View {
    let emojis: [String] = ["👻","🥽","🐞","🐲","🥽","👻","🥽","🐞","🐲","🥽","👻","🥽","🐞","🐲","🥽","👻","🥽","🐞","🐲","🥽"]
    @State var cardCount: Int = 6
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardsCountAdjuster
            
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount,id:\.self){ index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(.orange)
    }
    
    var cardsCountAdjuster: some View {
        HStack {
            CardRemover
            Spacer()
            CardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardsCountAdjuster(by offset: Int, symbol:String)-> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName:  symbol)
        })
       
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var CardRemover: some View {
        cardsCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var CardAdder: some View {
        cardsCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            print("Tapped")
            isFaceUp.toggle()
        }
    }
}

#Preview {
    SwiftUIView()
}
