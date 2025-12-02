//
//  ContentView.swift
//  QuizApp
//
//  Created by Felix Wich on 02.12.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
     
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
