//
//  HomeView.swift
//  iOS_Crypto
//
//  Created by Ortega on 08/03/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Text("Cryptocurrency Prices and Market Cap")
                .foregroundStyle(.primary)
                .padding(.vertical)
            
            TextField("Search...", text: $viewModel.searchBar)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Divider()
            
            CryptoButton(title: "Refresh", type: .refresh, action: {
                viewModel.loadCryptoData()
            })
            
            ScrollView {
                ForEach(viewModel.filterForCryptos, id: \.self) { crypto in
                    Button(action: {
                        navigationManager.push(.cryptoDetail(cripto: crypto))
                    }, label: {
                        CryptoSimpleView(
                            name: crypto.name,
                            symbol: crypto.symbol,
                            currentPrince: crypto.current_price,
                            lastUpdatedDate: crypto.last_updated,
                            imageURL: crypto.image
                        )
                    })
                    .foregroundColor(.primary)
                    Divider()
                }
            }
        }
        .refreshable {
            viewModel.loadCryptoData()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                CryptoButton(title: nil, type: .configuration, action: {
                    navigationManager.push(.settings)
                })
            })
        }
        .cryptoAlert(
            isPresented: $viewModel.showAlert,
            type: .informative,
            title: "Error",
            message: "Check your internet connection and try again",
            titlebutton: "Accept",
            actionButton: {}
        )
        .padding()
    }
}
