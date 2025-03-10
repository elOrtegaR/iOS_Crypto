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
                .padding()
            
            Divider()
            
            ScrollView {
                ForEach(viewModel.cryptos, id: \.self) { crypto in
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
                    .foregroundColor(.black)
                    
                    Divider()
                }
            }
        }
        .padding()
    }
}



#Preview {
    HomeView()
}
