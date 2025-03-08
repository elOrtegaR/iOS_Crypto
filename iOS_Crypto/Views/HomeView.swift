//
//  HomeView.swift
//  iOS_Crypto
//
//  Created by Ortega on 08/03/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button(action: {
                navigationManager.push(.cryptoDetail)
            }, label: {
                Text("Go to next view")
            })
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
