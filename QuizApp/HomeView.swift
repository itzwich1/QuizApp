//
//  HomeView.swift
//  QuizApp
//
//  Created by Felix Wich on 03.12.25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Binding var currentScreen: AppScreen
    
    // Die Variable 'showingLoginFields' ist hier nicht notwendig und wurde entfernt.
    
    var body: some View {
        
        VStack {
            
            Image("IconApp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
            
            Spacer()
            
            // --- LOGIN BUTTON ---
            Button("Login") {
                withAnimation {
                    currentScreen = .login
                }
            }
            .padding()
            .frame(maxWidth: 200)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            // --- REGISTER BUTTON ---
            Button("Register") {
                withAnimation {
                    currentScreen = .registration
                }
            }
            .padding()
            .frame(maxWidth: 200)
            .background(Color.white)
            .foregroundColor(.blue)
            .cornerRadius(10)
        }
    }
}
