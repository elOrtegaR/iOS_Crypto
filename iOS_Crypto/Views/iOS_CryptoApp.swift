//
//  iOS_CryptoApp.swift
//  iOS_Crypto
//
//  Created by Ortega on 08/03/25.
//

import SwiftUI

@main
struct iOS_CryptoApp: App {
    @StateObject private var settings = SettingsViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationManagerView()
                .environmentObject(settings)
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
        }
    }
}
