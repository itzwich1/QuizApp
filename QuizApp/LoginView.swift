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
    
    // Zustandsvariable, die verfolgt, ob die Login-Felder sichtbar sein sollen
    @State private var showingLoginFields = false
    
    // Variablen für die Eingabefelder
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            Image("Hintergrund")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            VStack {
                Image("IconApp")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                
                Spacer()
                
                
                if !showingLoginFields {
                    Button("Login") {
                        // Zustand ändern: Login-Felder werden jetzt angezeigt
                        withAnimation {
                            showingLoginFields = true
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }else {
                    VStack(spacing: 15) {
                        
                        // Eingabefeld für Benutzername
                        TextField("Benutzername", text: $username)
                            .padding()
                            .background(Color.white.opacity(0.8)) // Leicht transparenter Hintergrund
                            .cornerRadius(8)
                        
                        // Eingabefeld für Passwort (verdeckt die Eingabe)
                        SecureField("Passwort", text: $password)
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                        
                        // Anmelde-Button
                        Button("Anmelden") {
                            // TODO: Hier die tatsächliche Anmelde-Logik einfügen
                            print("Anmelden mit Benutzername: \(username) und Passwort: \(password)")
                        }
                        .padding()
                        .frame(maxWidth: .infinity) // Button über die gesamte Breite der Felder
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        
                        Button("Zurück") {
                            withAnimation {
                                showingLoginFields = false
                            }
                        }
                        .foregroundColor(.white)
                        .padding(.top, 5)
                    }
                    
                }
            }
            .padding()
        }
    }
}
