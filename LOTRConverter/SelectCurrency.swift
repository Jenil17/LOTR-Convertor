//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Jenil Jariwala on 2024-03-15.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency 
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .background(.brown)
                .ignoresSafeArea()
            VStack{
                Text("Select the curreny you are starting with:")
                    .fontWeight(.bold)
                    
                IconGrid(currency: $topCurrency)
                
                Text("Select the curreny you would like to convert to:")
                    .fontWeight(.bold)
                
                IconGrid(currency: $bottomCurrency)
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
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece))
}
