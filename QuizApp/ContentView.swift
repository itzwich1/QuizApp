//
//  ContentView.swift
//  QuizApp
//
//  Created by Felix Wich on 02.12.25.
//

import SwiftUI
import SwiftData

enum AppScreen {
    case login
    case home
}
struct ContentView: View {
    
    @State private var currentScreen: AppScreen = .login


    var body: some View {
        NavigationStack {
                    
                    // 3. Hier entscheidet die Logik, welche View geladen wird
                    switch currentScreen {
                    case .login:
                        // Lädt die dedizierte Login-Ansicht
                        LoginView(currentScreen: $currentScreen)
                    case .home:
                        // Lädt die dedizierte Home-Ansicht
                        HomeView(currentScreen: $currentScreen)
                    }
                }
                // Optional: Hier können Sie den globalen Hintergrund festlegen
                .background(Color.gray.opacity(0.1).ignoresSafeArea())    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
