//
//  Quote.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 13/01/26.
//

import Foundation

struct Quote: Identifiable, Codable, Equatable {
    let id: UUID
    let content: String
    let author: String

    init(content: String, author: String) {
        self.id = UUID()
        self.content = content
        self.author = author
    }
}
