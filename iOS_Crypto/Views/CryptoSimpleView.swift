//
//  CryptoSimpleView.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import SwiftUI

struct CryptoSimpleView: View {
    let name: String
    let symbol: String
    let currentPrince: Double
    let lastUpdatedDate: String
    let imageURL: String?
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: imageURL ?? "" )) { image in
                    image
                        .resizable()
                        .frame(width: 30, height: 30)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .padding(.leading)
                
                Text(name)
                    .foregroundStyle(.primary)
                    .padding(.trailing, 4)
                
                Text(symbol.uppercased())
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text(currentPrince.currentAmountToString())
                    .foregroundStyle(.primary)
                    .padding()
                
                Image(systemName: "chevron.right")
            }
            
            HStack {
                Text("Last update: \(lastUpdatedDate.toDate() ?? "---")")
                    .foregroundStyle(.tertiary)
                    .padding(.leading, 16)
                
                Spacer()
            }
        }
    }
}
