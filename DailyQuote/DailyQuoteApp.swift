//
//  DailyQuoteApp.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 12/01/26.
//

import SwiftUI

@main
struct DailyQuoteApp: App {

    @StateObject private var favoritesStore = FavoritesStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesStore)
        }
    }
}
