//
//  NavigationManagerTests.swift
//  iOS_CryptoTests
//
//  Created by Ortega on 11/03/25.
//

import XCTest
@testable import iOS_Crypto

final class NavigationManagerTests: XCTestCase {
    var navigationManager: NavigationManager!

    override func setUp() {
        super.setUp()
        navigationManager = NavigationManager()
    }
    
    override func tearDown() {
        navigationManager = nil
        super.tearDown()
    }
    
    func test_push_HomeView() {
        let screen = NavigationDestination.home
        navigationManager.path.append(screen)
        
        XCTAssertEqual(navigationManager.path.count, 1, "The path should contain one screen")
    }
    
    func test_pop_view() {
        let screenHome = NavigationDestination.home
        let screenSettings = NavigationDestination.settings
        
        navigationManager.push(screenHome)
        navigationManager.push(screenSettings)
        navigationManager.pop()
        
        XCTAssertEqual(navigationManager.path.count, 1, "Navigation Manager should contain only 1 screen")
    }
    
    func test_pop_to_root() {
        let screenHome = NavigationDestination.home
        let screenSettings = NavigationDestination.settings
        
        navigationManager.push(screenHome)
        navigationManager.push(screenSettings)
        navigationManager.popToRoot()
        
        XCTAssertEqual(navigationManager.path.count, 0, "Navigation Manager should not contain screens")
    }
}
