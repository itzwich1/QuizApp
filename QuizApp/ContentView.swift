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
    case dashboard
}
struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    
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
                case .dashboard:
                    DashboardView(currentScreen: $currentScreen)
                }
            }.onAppear{
                printAllUsers()
                
                QuestionService.generateDefaultQuestions(context: modelContext)
                
            }.onChange(of: currentScreen){
                oldValue, newValue in
                
                print("Screen gewechselt: Lade Benutzer neu...")
                printAllUsers()
            }
        }
        
    }
    
    
    func printAllUsers() {
        // Erstellt einen Deskriptor, der alle Benutzer abruft (ohne Predicate/Filter)
        let descriptor = FetchDescriptor<UserModel>()
        
        do {
            let fetchedUsers = try modelContext.fetch(descriptor)
            
            print("--- SWIFTDATA BENUTZER-PROTOKOLL ---")
            if fetchedUsers.isEmpty {
                print("Keine Benutzer in der Datenbank gefunden.")
            } else {
                print("Gefundene Benutzer (Anzahl: \(fetchedUsers.count)):")
                for user in fetchedUsers {
                    // Wichtig: Geben Sie NICHT das echte Passwort oder den Hash aus!
                    print("  -> Benutzername: \(user.username), Hash: \(user.passwordHash.prefix(10))...")
                }
            }
            print("-----------------------------------")
            
        } catch {
            print("Fehler beim Abrufen der SwiftData-Daten: \(error)")
        }
    }
    
    /////////////////
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
