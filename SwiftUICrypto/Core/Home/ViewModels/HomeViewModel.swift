//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Vansh Dubey on 08/01/26.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.allCoins.append(DeveloperPreview.preview.coin)
            self.portfolioCoins.append(DeveloperPreview.preview.coin)
        }
    }
}
