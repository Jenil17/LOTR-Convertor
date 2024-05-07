//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Jenil Jariwala on 2024-03-13.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState  var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    var body: some View {
        
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                HStack{
                    VStack{
                        
                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(),arrowEdge: .bottom)
                        
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                        
                            .onChange(of: leftAmount){
                                if leftTyping == true{
                                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                }
                            }
                            .onChange(of: leftCurrency){
                                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                                
                            }
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    VStack{
                        
                        HStack{
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .onChange(of: rightAmount){
                                if rightTyping == true{
                                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                                }
                            }
                            .onChange(of: rightCurrency){
                                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                            }
                    }
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                HStack{
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                        
                    }label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                            ExchangeInfo()
                    }
                }
                
            }
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
        .task {
            try? Tips.configure()
        }
    }
}

#Preview {
    ContentView()
}
