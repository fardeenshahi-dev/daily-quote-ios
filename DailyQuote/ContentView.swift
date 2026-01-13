//
//  ContentView.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 12/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Today", systemImage: "quote.opening")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(FavoritesStore())
}
