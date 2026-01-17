//
//  CoinRowView.swift
//  SwiftUICrypto
//
//  Created by Vansh Dubey on 08/01/26.
//

import SwiftUI

struct CoinRowView: View {
    var coin: CoinModel
    var showHoldings: Bool
    
    var body: some View {
        HStack(spacing: 0){
            leftCol
            Spacer()
            if showHoldings{
                centerCol
            }
            rightCol
        }.font(.subheadline)
        .foregroundStyle(Color.theme.accentColor)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: DeveloperPreview.preview.coin, showHoldings: true)
        
}

extension CoinRowView{
    private var leftCol : some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .foregroundStyle(Color.theme.secondaryTextColor)
                .frame(minWidth: 30)
                .font(.headline)
            Circle().frame(width: 30, height: 30)
            Text(coin.symbol.uppercased()).font(.headline).padding(.leading,6).foregroundStyle(Color.theme.accentColor)
        }
    }
    
    private var rightCol : some View{
        VStack(alignment: .trailing){
            Text("\(coin.currentPrice.formattedCurrency())")
            Text(coin.priceChangePercentage24H?.formattedPercentageString() ?? "").foregroundStyle(coin.priceChangePercentage24H ?? 0 < 0 ? Color.theme.redColor : Color.theme.greenColor)
        }.frame(width: UIScreen.main.bounds.width/3, alignment: .trailing)
            .padding(.trailing, 8)
    }
    
    private var centerCol : some View{
        VStack(alignment: .trailing) {
            Text("\(coin.currentHoldingsValue.formattedCurrency(maxfractionDigits: 2))")
            Text("\(coin.currentHoldings?.formattedString(fractiondigits: 2) ?? "0")")
        }
    }
}
