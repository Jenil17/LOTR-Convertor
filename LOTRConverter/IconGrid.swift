//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Jenil Jariwala on 2024-03-16.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            ForEach(Currency.allCases) { currency in
                if self.currency == currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }
                else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPiece))
}
