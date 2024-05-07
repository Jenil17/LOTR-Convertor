//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Jenil Jariwala on 2024-03-15.
//

import Foundation
import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let contentText: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(contentText)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece,contentText: "1 Silver piece = 4 Silver Pennies",rightImage: .silverpenny)
}
