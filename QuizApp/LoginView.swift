//
//  LoginView.swift
//  QuizApp
//
//  Created by Felix Wich on 02.12.25.
//


import SwiftUI
import SwiftData


struct LoginView: View {
    // Bindung zum zentralen Zustand, um den Screen zu wechseln
    @Binding var currentScreen: AppScreen
    
    
    
    // Variablen für die Eingabefelder
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
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
            // TODO: Hier die tatsächliche Anmelde-Logik einfügen
            print("Anmelden mit Benutzername: \(username) und Passwort: \(password)")
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
