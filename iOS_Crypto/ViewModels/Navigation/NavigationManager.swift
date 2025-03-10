//
//  NavigationManager.swift
//  iOS_Crypto
//
//  Created by Ortega on 08/03/25.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path: NavigationPath = .init()
    
    func push(_ screen: NavigationDestination) {
        path.append(screen)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
