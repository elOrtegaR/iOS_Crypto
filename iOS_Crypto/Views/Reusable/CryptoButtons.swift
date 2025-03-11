//
//  CryptoButtons.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import SwiftUI

enum ButtonType {
    case primary, secondary, configuration, refresh
}

struct CryptoButtons: View {
    var title: String?
    var type: ButtonType
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                if let titleButton = title {
                    Text(titleButton)
                        .font(.system(size: fontSize, weight: .semibold))
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .frame(height: heightButton)
                }
                
                if let icon = iconButton {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .cornerRadius(12)
            .background(backgroundColor)
            .frame(maxWidth: .infinity)
        })
        
        .padding()
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
            return 28
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
            return 16
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
}

#Preview {
    VStack {
        CryptoButtons(title: "Test primary Button", type: .primary, action: {})
            .padding(.vertical)
        CryptoButtons(title: "Test secondary Button", type: .secondary, action: {})
            .padding(.vertical)
        CryptoButtons(title: nil, type: .configuration, action: {})
            .padding(.vertical)
        CryptoButtons(title: nil, type: .refresh, action: {})
            .padding(.vertical)
    }
}

