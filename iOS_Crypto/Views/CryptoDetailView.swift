//
//  CryptoDetailView.swift
//  iOS_Crypto
//
//  Created by Ortega on 08/03/25.
//

import SwiftUI

struct CryptoDetailView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    let viewModel = CryptoDetailViewModel()
    let crypto: Crypto
    
    var body: some View {
        VStack {
            ScrollView {
                AsyncImage(url: URL(string: crypto.image ?? "")) { image in
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .padding()
                
                Text(crypto.name)
                    .foregroundStyle(.primary)
                
                HStack {
                    Text(crypto.symbol.uppercased())
                        .foregroundStyle(.secondary)
                        .padding(.top, 8)
                }
                
                Divider()
                
                Text("Price change (24h)")
                    .padding()
                
                Text(crypto.price_change_24h.currentAmountToString(maxDigits: 6))
                    .padding()
                
                HStack {
                    Image(viewModel.isAmountNegative(amount: crypto.price_change_percentage_24h) ? "chevronRedDown" : "chevronGreenUp")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("\(crypto.price_change_percentage_24h)%")
                        .foregroundStyle(.tertiary)
                }
                
                Divider()
                    .padding(.vertical)
                    .padding(.horizontal, 32)
                
                HStack {
                    VStack {
                        Text("Highest price (24h)")
                            .padding()
                        
                        Text(crypto.high_24h.currentAmountToString(maxDigits: 6))
                            .padding()
                        
                        Divider()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Lowest Price (24h)")
                            .padding()
                        
                        Text(crypto.low_24h.currentAmountToString(maxDigits: 6))
                            .padding()
                        
                        Divider()
                    }
                }
                
                HStack {
                    VStack {
                        Text("Total volume (24h)")
                            .padding()
                        
                        Text(crypto.total_volume.currentAmountToString(maxDigits: 6))
                            .padding()
                        
                        Divider()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Market CAP (24h)")
                            .padding()
                        
                        Text(crypto.market_cap.currentAmountToString(maxDigits: 6))
                            .padding()
                        
                        Divider()
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle("Crypto details")
    }
}
