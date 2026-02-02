//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Vansh Dubey on 08/01/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    var cancellables = Set<AnyCancellable>()
    
    let dataService = CoinDataService()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers(){
        dataService.$allCoins.sink {[weak self] (returnedCoins) in
            self?.allCoins = returnedCoins
        }.store(in: &cancellables)
    }
}
