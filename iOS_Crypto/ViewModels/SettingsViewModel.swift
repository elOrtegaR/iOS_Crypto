//
//  SettingsViewModel.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var isDarkMode: Bool = UserDefaults.standard.bool(forKey: "darkMode") {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "darkMode")
        }
    }
}
