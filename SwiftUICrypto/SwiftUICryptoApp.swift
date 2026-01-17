//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Vansh Dubey on 05/01/26.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    @EnvironmentObject private var vm: HomeViewModel
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().toolbarVisibility(.hidden)
            }.environmentObject(vm)
        }
    }
}
