//
//  CryptoModel.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import Foundation


/// A data model that determinates the characteristics for Cryptos
struct Crypto: Codable, Hashable {
    
    /// The Cripto's Identifier
    let id: String
    
    /// The Cripto's symbol
    let symbol: String
    
    /// The Cripto's name
    let name: String
    
    /// The Cripto's URL icon
    let image: String?
    
    /// Current prince of Crypto
    let current_price: Double
    
    /// Market CAP
    let market_cap: Double
    
    /// Ranking position of market CAP
    let market_cap_rank: Int
    
    /// Fully diluated valuation of Crypto
    let fully_diluted_valuation: Double?
    
    /// Total volume of last 24 hours transactions
    let total_volume: Double
    
    /// Highest price of last 24 hours
    let high_24h: Double
    
    /// lowest price of last 24 hours
    let low_24h: Double
    
    /// Price changed of last 24 hors
    let price_change_24h: Double
    
    /// Price changed percentage of last 24 hors
    let price_change_percentage_24h: Double
    
    /// CAP changes of last 24 hours
    let market_cap_change_24h: Double
    
    /// CAP changes percentage of last 24 hours
    let market_cap_change_percentage_24h: Double
    
    /// The circulating supply of Cryto
    let circulating_supply: Double
    
    /// Total supplyt of Crypto
    let total_supply: Double?
    
    /// Maximum supply of Crypto
    let max_supply: Double?
    
    /// ATH (All Time High of Crypto) of Crypto
    let ath: Double
    
    /// ATH (All Time High of Crypto) percentage of Crypto
    let ath_change_percentage: Double
    
    /// ATH (All Time High of Crypto) date (format ISO 8601) of Crypto
    let ath_date: String
    
    /// ATL (All Time Low of Crypto) of Crypto
    let atl: Double
    
    /// ATL (All Time Low of Crypto) percentage of Crypto
    let atl_change_percentage: Double
    
    /// ATL (All Time Low of Crypto) date (format ISO 8601) of Crypto
    let atl_date: String
    
    /// Unkwon
//    let roi: String?
    
    /// Date time of last update
    let last_updated: String
}
