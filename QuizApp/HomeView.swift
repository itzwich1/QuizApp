//
//  HomeView.swift
//  QuizApp
//
//  Created by Felix Wich on 02.12.25.
//


import SwiftUI
import SwiftData

struct HomeView: View {
    @Binding var currentScreen: AppScreen
    
    var body: some View {
        VStack {
            Text("Willkommen!")
                .font(.largeTitle)
            
            // ... Der gesamte Hauptinhalt der App hier ...
            
            Button("Logout") {
                // Nach dem Logout: Zustand ändern und zurück zur Login-Seite
                currentScreen = .login
            }
            .tint(.red)
        }
        .navigationTitle("Startseite")
    }
}
