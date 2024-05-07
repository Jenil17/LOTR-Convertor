//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Jenil Jariwala on 2024-03-13.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                ExchangeRate(leftImage: .goldpiece, contentText: "1 Gold Piece =  4 Gold pennies", rightImage: .goldpenny)
                
                ExchangeRate(leftImage: .goldpenny, contentText: "1 Gold Penny =  4 Silver Pieces", rightImage: .silverpenny)
               
                ExchangeRate(leftImage: .silverpiece, contentText: "1 Silver Piece =  4 Silver pennies", rightImage: .silverpenny)
               
                ExchangeRate(leftImage: .silverpenny, contentText: "1 Silver Penny =  100 Copper pennies", rightImage: .copperpenny)
               
                Button("Done"){
                    dismiss()
                    print(dismiss)
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}

