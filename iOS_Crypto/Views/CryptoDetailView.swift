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
                    .font(.title2)
                
                HStack {
                    Text(crypto.symbol.uppercased())
                        .foregroundStyle(.secondary)
                        .padding(.top, 8)
                        .font(.headline)
                }
                
                Divider()
                
                Text("Price change (24h)")
                    .foregroundStyle(.primary)
                    .font(.title3)
                    .padding()
                
                Text(crypto.price_change_24h.currentAmountToString(maxDigits: 6))
                    .foregroundStyle(.primary)
                    .font(.headline)
                    .padding()
                
                HStack {
                    Image(viewModel.isAmountNegative(amount: crypto.price_change_percentage_24h) ? "chevronRedDown" : "chevronGreenUp")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("\(crypto.price_change_percentage_24h)%")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                
                Divider()
                    .padding(.vertical)
                    .padding(.horizontal, 32)
                
                HStack {
                    VStack {
                        Text("Highest price (24h)")
                            .foregroundStyle(.primary)
                            .font(.title3)
                            .padding()
                        
                        Text(crypto.high_24h.currentAmountToString(maxDigits: 6))
                            .foregroundStyle(.primary)
                            .font(.headline)
                            .padding()
                        
                        Divider()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Lowest Price (24h)")
                            .foregroundStyle(.primary)
                            .font(.title3)
                            .padding()
                        
                        Text(crypto.low_24h.currentAmountToString(maxDigits: 6))
                            .foregroundStyle(.primary)
                            .font(.headline)
                            .padding()
                        
                        Divider()
                    }
                }
                
                HStack {
                    VStack {
                        Text("Total volume (24h)")
                            .foregroundStyle(.primary)
                            .font(.title3)
                            .padding()
                        
                        Text(crypto.total_volume.currentAmountToString(maxDigits: 6))
                            .foregroundStyle(.primary)
                            .font(.headline)
                            .padding()
                        
                        Divider()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Market CAP (24h)")
                            .foregroundStyle(.primary)
                            .font(.title3)
                            .padding()
                        
                        Text(crypto.market_cap.currentAmountToString(maxDigits: 6))
                            .foregroundStyle(.primary)
                            .font(.headline)
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
