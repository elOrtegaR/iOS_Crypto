//
//  ConfigurationView.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    @EnvironmentObject private var settings: SettingsViewModel
    
    var body: some View {
        VStack {
            Text("Customize your preferences")
                .foregroundStyle(.primary)
                .padding()
            
            List(content: {
                Toggle("Dark mode", isOn: $settings.isDarkMode)
            })
            
            Spacer()
        }
        .navigationTitle("Settings")
    }
}
