//
//  Regestration.swift
//  QuizApp
//
//  Created by Felix Wich on 03.12.25.
//

import SwiftUI
import SwiftData

struct RegistrationView: View {
    
    @Environment(\.modelContext) var modelContext // Zugriff auf SwiftData
    
    // Bindung zum zentralen Zustand, um den Screen zu wechseln
    @Binding var currentScreen: AppScreen
    
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var registrationMessage = ""
    
    @StateObject private var authService = AuthService()
    
    var body: some View {
        
        VStack{
            // Eingabefeld für Benutzername
            TextField("Benutzername", text: $username)
                .padding()
                .frame(maxWidth: 380)
                .background(Color.white.opacity(0.8))
                .foregroundColor(Color.black)
                .cornerRadius(8)
            
            // Eingabefeld für Passwort (verdeckt die Eingabe)
            SecureField("Passwort", text: $password)
                .padding()
                .frame(maxWidth: 380)
                .background(Color.white.opacity(0.8))
                .cornerRadius(8)
            
            // Anmelde-Button
            Button("Registrieren") {
                
                if(!username.isEmpty && !password.isEmpty){
                    if authService.registerUser(username: username, passwordText: password, context: modelContext){
                        
                        registrationMessage = "Registrierung erfolgreich"
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                            withAnimation{currentScreen = .login}
                        }
                    }else {
                        registrationMessage = "Fehler bei der Registrierung. Benutzername vielleicht vergeben."
                    }
                    
                }else {
                    registrationMessage = "Error: Benutzername und Passwort \n dürfen nicht leer sein!"
                }
                

                
            }
            .padding()
            .frame(maxWidth: 380) // Button über die gesamte Breite der Felder
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
        
        
        Text(registrationMessage)
                        .foregroundColor(registrationMessage.contains("Error") ? .red : .green)
        
        Button("Zurück") {
            withAnimation {
                currentScreen = .home
            }
        }
        .foregroundColor(.white)
        .padding(.top, 5)
    }
}


