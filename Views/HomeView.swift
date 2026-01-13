//
//  HomeView.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 13/01/26.
//

import Foundation
import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = QuoteViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                if viewModel.isLoading {
                    ProgressView()
                } else if let quote = viewModel.currentQuote {
                    QuoteCardView(quote: quote)
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }

                Button {
                    Task {
                        await viewModel.fetchQuote()
                    }
                } label: {
                    Image(systemName: "arrow.clockwise")
                        .font(.title2)
                }
                .padding(.top, 16)

            }
            .padding()
            .navigationTitle("Daily Quote")
            .task {
                await viewModel.fetchQuote()
            }
        }
    }
}
#Preview {
    HomeView()
        .environmentObject(FavoritesStore())
}
