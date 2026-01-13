//
//  FavoritesView.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 12/01/26.
//

import Foundation
import SwiftUI


struct FavoritesView: View {

    @EnvironmentObject var favoritesStore: FavoritesStore

    var body: some View {
        NavigationStack {

            if favoritesStore.favorites.isEmpty {
                ContentUnavailableView(
                    "No Favorites",
                    systemImage: "heart",
                    description: Text("Quotes you love will appear here.")
                )
            } else {
                List {
                    ForEach(favoritesStore.favorites) { quote in
                        QuoteCardView(quote: quote)
                            .environmentObject(favoritesStore)
                            .listRowSeparator(.hidden)
                            .contentShape(Rectangle())
                            .onTapGesture { }
                            
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Favorites")
    }
}
#Preview {
    FavoritesView()
        .environmentObject(FavoritesStore())
}
