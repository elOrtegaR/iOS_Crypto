//
//  CryptoDetailView.swift
//  iOS_Crypto
//
//  Created by Ortega on 08/03/25.
//

import SwiftUI

struct CryptoDetailView: View {
    @EnvironmentObject private var navigationManager: NavigationManager

    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
            
            Button(action: {
                navigationManager.pop()
            }, label: {
                Text("Go back")
            })
        }
    }
}

#Preview {
    CryptoDetailView()
}
