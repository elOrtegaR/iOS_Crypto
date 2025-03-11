//
//  SettingsViewModelTests.swift
//  iOS_CryptoTests
//
//  Created by Ortega on 11/03/25.
//

import XCTest
@testable import iOS_Crypto

final class SettingsViewModelTests: XCTestCase {

    var viewModel: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = SettingsViewModel()
        UserDefaults.standard.removeObject(forKey: "darkMode")
    }
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: "darkMode")
        viewModel = nil
        super.tearDown()
    }
    
    func test_isDarkModeOn() {
        viewModel.isDarkMode = true
        XCTAssertTrue(UserDefaults.standard.bool(forKey: "darkMode"), "Value should be true")
    }
    
    func test_isDarkModeOff() {
        viewModel.isDarkMode = false
        XCTAssertFalse(UserDefaults.standard.bool(forKey: "darkMode"), "Value should be false")
    }
}
