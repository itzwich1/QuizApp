//
//  LoginView.swift
//  QuizApp
//
//  Created by Felix Wich on 02.12.25.
//


import SwiftUI
import SwiftData


struct LoginView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var currentScreen: AppScreen
    
    
    
    // Variablen für die Eingabefelder
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginMessage = ""
    
    @StateObject private var authService = AuthService()
    
    var body: some View {
        
        VStack{
            // Eingabefeld für Benutzername
            TextField("Benutzername", text: $username)
                .padding()
                .frame(maxWidth: 380)
                .background(Color.white.opacity(0.8)) // Leicht transparenter Hintergrund
                .cornerRadius(8)
            
            // Eingabefeld für Passwort (verdeckt die Eingabe)
            SecureField("Passwort", text: $password)
                .padding()
                .frame(maxWidth: 380)
                .background(Color.white.opacity(0.8))
                .cornerRadius(8)
            
            // Anmelde-Button
            Button("Anmelden") {
                
                if authService.verifyLogin(username: username, passwordText: password, context: modelContext) {
                    loginMessage = "Login erfolgreich! Weiterleitung..."
                    
                    // Bei Erfolg: Weiter zur Haupt-App-Seite
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation{currentScreen = .dashboard}
                    }
                } else {
                    loginMessage = "Anmeldedaten falsch. Bitte erneut versuchen."
                }
                
                
            }
            .padding()
            .frame(maxWidth: 380) // Button über die gesamte Breite der Felder
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            
            Button("Zurück") {
                withAnimation {
                    currentScreen = .home
                }
            }
            .foregroundColor(.white)
            .padding(.top, 5)
        }
        
        
        
        
    }
}
