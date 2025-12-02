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
    
    // ... @State Variablen für Benutzername/Passwort ...

    var body: some View {
        ZStack{
            Image("Hintergrund")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .ignoresSafeArea()
        VStack {
            Image("IconApp").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
            
            
            Button("Login"){
                
            }
            .padding().background(Color.blue).foregroundColor(.white).cornerRadius(10)
            
            
        }
        .padding()
        }
    }
}
