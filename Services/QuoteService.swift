//
//  QuoteService.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 13/01/26.
//

import Foundation

struct ZenQuoteResponse: Decodable {
    let q: String
    let a: String
}

final class QuoteService {

    func fetchRandomQuote() async throws -> Quote {
        let url = URL(string: "https://zenquotes.io/api/random")!
        let (data, _) = try await URLSession.shared.data(from: url)

        let decoded = try JSONDecoder().decode([ZenQuoteResponse].self, from: data)

        guard let first = decoded.first else {
            throw URLError(.badServerResponse)
        }

        return Quote(content: first.q, author: first.a)
    }
}     
