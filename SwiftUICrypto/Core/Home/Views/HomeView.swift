//
//  HomeView.swift
//  SwiftUICrypto
//
//  Created by Vansh Dubey on 06/01/26.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.backgroundColor.ignoresSafeArea()
            VStack{
                HomeHeaderView
                Spacer()
            }
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
}

#Preview {
    HomeView().toolbarVisibility(.hidden)
}
