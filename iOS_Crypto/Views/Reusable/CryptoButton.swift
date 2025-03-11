//
//  CryptoButton.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import SwiftUI

enum ButtonType {
    case primary, secondary, configuration, refresh
}

struct CryptoButton: View {
    var title: String?
    var type: ButtonType
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                if let titleButton = title {
                    Text(titleButton)
                        .font(.system(size: fontSize, weight: .semibold))
                        .foregroundColor(fontColor)
                        .frame(height: heightButton)
                        .padding(.vertical)
                }
                
                if let icon = iconButton {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
                
            }
            .background(backgroundColor)
            .cornerRadius(20)
            .frame(maxWidth: .infinity)
        })
    }
    
    private var backgroundColor: Color {
        switch type {
        case .primary:
            return .gray
        case .secondary:
            return .clear
        case .configuration:
            return Color.clear
        case .refresh:
            return Color.clear
        }
    }
    
    private var fontColor: Color {
        switch type {
        case .primary:
            return .primary
        case .secondary:
            return .black
        case .configuration:
            return Color.clear
        case .refresh:
            return .primary
        }
    }
    
    private var shadowColor: Color {
        switch type {
        case .primary:
            return Color.black.opacity(0.2)
        case .secondary:
            return Color.clear
        case .configuration:
            return Color.black.opacity(0.2)
        case .refresh:
            return Color.black.opacity(0.2)
        }
    }

    
    private var heightButton: CGFloat {
        switch type {
        case .primary:
            return 48
        case .secondary:
            return 40
        case .configuration:
            return 32
        case .refresh:
            return 14
        }
    }
    
    private var fontSize: CGFloat {
        switch type {
        case .primary:
            return 24
        case .secondary:
            return 21
        case .configuration:
            return 18
        case .refresh:
            return 14
        }
    }
    
    private var iconButton: String? {
        switch type {
        case .primary:
            return nil
        case .secondary:
            return nil
        case .configuration:
            return "gear"
        case .refresh:
            return "arrow.clockwise"
        }
    }
    
    private var iconSize: CGFloat {
        switch type {
        case .primary:
            return 0
        case .secondary:
            return 0
        case .configuration:
            return 24
        case .refresh:
            return 14
        }
    }
}

#Preview {
    VStack {
        CryptoButton(title: "Test primary Button", type: .primary, action: {})
            .padding(.vertical)
        CryptoButton(title: "Test secondary Button", type: .secondary, action: {})
            .padding(.vertical)
        CryptoButton(title: nil, type: .configuration, action: {})
            .padding(.vertical)
        CryptoButton(title: "Update", type: .refresh, action: {})
            .padding(.vertical)
    }
}

