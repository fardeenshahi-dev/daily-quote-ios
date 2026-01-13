//
//  FavoritesStore.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 13/01/26.
//

import Foundation
import Combine

final class FavoritesStore: ObservableObject {

    @Published private(set) var favorites: [Quote] = []

    private let key = "saved_quotes"

    init() {
        load()
    }

    func toggleFavorite(_ quote: Quote) {
        if favorites.contains(where: { $0.id == quote.id }) {
            favorites.removeAll { $0.id == quote.id }
        } else {
            favorites.append(quote)
        }
        save()
    }

    func isFavorite(_ quote: Quote) -> Bool {
            favorites.contains(quote)
        }

    private func save() {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func load() {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let decoded = try? JSONDecoder().decode([Quote].self, from: data)
        else { return }

        favorites = decoded
    }
}
