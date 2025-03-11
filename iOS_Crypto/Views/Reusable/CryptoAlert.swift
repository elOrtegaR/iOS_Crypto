//
//  CryptoAlert.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import Foundation
import SwiftUI

enum AlertType {
    case informative
    case actionAlert
}

struct CryptoAlert: View {
    
    let type: AlertType
    let title: String
    let message: String
    let titlebutton: String
    let actionButton: () -> Void
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(height: textSize(title, textSize: 18).height + 30)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Text(message)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .frame(height: textSize(message, textSize: 18).height + 30)
                .padding(.top, 8)
                .padding(.horizontal, 8)
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
            
            CryptoButton(
                title: titlebutton,
                type: .secondary,
                action: { actionButton() }
            )
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
        .frame(maxWidth: 300)
    }
    
    private func textSize(_ text: String, textSize: Int) -> CGSize {
        let font = UIFont.systemFont(ofSize: CGFloat(textSize), weight: .semibold)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size
    }
}

struct CryptoAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    let type: AlertType
    let title: String
    let message: String
    let titlebutton: String
    let actionButton: () -> Void
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: isPresented ? 3 : 0)
            
            if isPresented {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                
                CryptoAlert(
                    type: type,
                    title: title,
                    message: message,
                    titlebutton: titlebutton,
                    actionButton: dismissAlert
                )
                .transition(
                    .scale(scale: 0.85, anchor: .center)
                    .combined(with: .opacity)
                )
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPresented)
    }
    
    func dismissAlert() {
        isPresented = false
        actionButton()
    }
}

extension View {
    func cryptoAlert(
        isPresented: Binding<Bool>,
        type: AlertType,
        title: String,
        message: String,
        titlebutton: String,
        actionButton: @escaping () -> Void
        
    ) -> some View {
        self.modifier(
            CryptoAlertModifier (
                isPresented: isPresented,
                type: type,
                title: title,
                message: message,
                titlebutton: titlebutton,
                actionButton: actionButton
            )
        )
    }
}
