//
//  CryptoDetailViewModel.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import Foundation

class CryptoDetailViewModel {
    
    func isAmountNegative(amount: Double) -> Bool {
        return amount < 0
    }
}
