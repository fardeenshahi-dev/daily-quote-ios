//
//  QuoteViewModel.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 13/01/26.
//

import Foundation
import Combine

@MainActor
final class QuoteViewModel: ObservableObject {

    @Published var currentQuote: Quote?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service = QuoteService()

    func fetchQuote() async {
        isLoading = true
        errorMessage = nil

        do {
            let quote = try await service.fetchRandomQuote()
            self.currentQuote = quote
        } catch {
            self.errorMessage = "Couldn’t load a new quote right now. Please try again shortly."
        }

        isLoading = false
    }
}
