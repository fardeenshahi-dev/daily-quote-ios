//
//  QuoteCardView.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 13/01/26.
//

import Foundation
import SwiftUI

struct QuoteCardView: View {
    let quote: Quote

    @EnvironmentObject var favoritesStore: FavoritesStore
    @State private var showShareSheet = false

    var body: some View {
        VStack(spacing: 16) {

            Text("“\(quote.content)”")
                .font(.title3)
                .multilineTextAlignment(.center)

            Text(quote.author)
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack {

                Button {
                    withAnimation {
                        favoritesStore.toggleFavorite(quote)
                    }
                } label: {
                    Image(systemName:
                        favoritesStore.isFavorite(quote)
                        ? "heart.fill"
                        : "heart"
                    )
                }
                .buttonStyle(.plain)   // 🔥 VERY IMPORTANT

                Spacer()

                Button {
                    showShareSheet = true
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                .buttonStyle(.plain)   // 🔥 VERY IMPORTANT
            }
            .font(.title3)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(
                items: ["\(quote.content)\n— \(quote.author)"]
            )
        }
    }
}
