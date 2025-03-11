//
//  ExtensionsSwiftUI.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import Foundation
import SwiftUI

extension Double {
    func currentAmountToString(maxDigits: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = maxDigits
        formatter.minimumFractionDigits = 2
        formatter.currencySymbol = "$"
        
        return formatter.string(from: NSNumber(value: self)) ?? "$ 0.00"
    }
}

extension String {
    func toDate () -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        
        if let date = formatter.date(from: self) {
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        
        return nil
    }
}
