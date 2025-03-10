//
//  CryptoDetailView.swift
//  iOS_Crypto
//
//  Created by Ortega on 08/03/25.
//

import SwiftUI

struct CryptoDetailView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    let crypto: Crypto
    
    var body: some View {
        VStack {
            Text(crypto.name)
        }
    }
}
