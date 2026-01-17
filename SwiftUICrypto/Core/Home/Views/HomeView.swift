//
//  HomeView.swift
//  SwiftUICrypto
//
//  Created by Vansh Dubey on 06/01/26.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @EnvironmentObject private var homeVM: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.backgroundColor.ignoresSafeArea()
            VStack{
                HomeHeaderView
                HStack{
                    Text("Coin")
                    Spacer()
                    if showPortfolio{
                        Text("Holding")
                    }
                    Text("Price").frame(width: UIScreen.main.bounds.width/3, alignment: .trailing)
                }.font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color.theme.secondaryTextColor)
                .padding([.horizontal, .top])
                if !showPortfolio{
                    allCoinList.transition(.move(edge: .leading))
                }else{
                    portfolioCoinList.transition(.move(edge: .trailing))
                }
                Spacer()
            }.animation(.easeInOut, value: showPortfolio)
        }
    }
}

extension HomeView{
    var HomeHeaderView: some View {
        HStack{
            CircleButton(iconName: showPortfolio ? "plus" : "info")
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices").font(.system(size: 24, weight: .heavy, design: .rounded)).foregroundStyle(Color.theme.accentColor)
            Spacer()
            CircleButton(iconName: showPortfolio ? "chevron.left" :"chevron.right"){
                showPortfolio.toggle()
            }
        }.padding(.horizontal)
        
    }
    
    private var allCoinList: some View{
        List{
            ForEach(homeVM.allCoins){ coin in
                CoinRowView(coin: coin, showHoldings: false).listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.listStyle(.plain)
    }
    private var portfolioCoinList: some View{
        List{
            ForEach(homeVM.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldings: true).listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.listStyle(.plain)
    }
}

#Preview {
    HomeView().toolbarVisibility(.hidden).environmentObject(DeveloperPreview.preview.homevm)
}
