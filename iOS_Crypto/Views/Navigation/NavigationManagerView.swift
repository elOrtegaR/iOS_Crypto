//
//  NavigationManagerView.swift
//  iOS_Crypto
//
//  Created by Ortega on 08/03/25.
//

import SwiftUI

struct NavigationManagerView: View {
    @StateObject var navigationManager = NavigationManager()
    var body: some View {
        
        NavigationStack(path: $navigationManager.path) {
            HomeView()
                .navigationTitle("Crypto App")
                .navigationDestination(for: NavigationDestination.self) { screen in
                    screenView(for: screen)
                }
        }
        .environmentObject(navigationManager)
    }
    
    @ViewBuilder
    private func screenView(for screen: NavigationDestination) -> some View {
        switch screen {
        case .home:
            HomeView()
        case .cryptoDetail(let crypto):
            CryptoDetailView(crypto: crypto)
        case .settings:
            SettingsView()
        }
    }
}
