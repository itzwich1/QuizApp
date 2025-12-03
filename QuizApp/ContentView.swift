//
//  ContentView.swift
//  QuizApp
//
//  Created by Felix Wich on 02.12.25.
//

import SwiftUI
import SwiftData

enum AppScreen {
    case home
    case login
    case registration
}
struct ContentView: View {
    
    @State private var currentScreen: AppScreen = .home

    let backgroundAssetName = "Hintergrund"
    

    var body: some View {
        
        ZStack {
            
            // --- DAUERHAFTER HINTERGRUND ---
            Image(backgroundAssetName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                switch currentScreen {
                case .home:
                    HomeView(currentScreen: $currentScreen)
                case .login:
                    LoginView(currentScreen: $currentScreen)
                case .registration:
                    RegistrationView(currentScreen: $currentScreen)
                }
            }
        }
        
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
