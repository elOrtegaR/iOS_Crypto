//
//  HomeViewModel.swift
//  iOS_Crypto
//
//  Created by Ortega on 10/03/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var cryptos: [Crypto] = .init()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadCryptoData()
    }
    
    func loadCryptoData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Crypto].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let failure):
                    print("Error: \(failure.localizedDescription)")
                }
            }, receiveValue: { [weak self] value in
                self?.cryptos = Array(value.prefix(20))
            })
            .store(in: &cancellables)
    }
    
}
