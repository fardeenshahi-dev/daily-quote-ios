//
//  EmptyStateView.swift
//  DailyQuote
//
//  Created by Fardeen Shahi on 13/01/26.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart")
                .font(.system(size: 50))
                .foregroundColor(.secondary)

            Text("No Favorites Yet")
                .font(.title3)
                .fontWeight(.semibold)

            Text("Tap the heart icon on a quote to save it here.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    EmptyStateView()
}
