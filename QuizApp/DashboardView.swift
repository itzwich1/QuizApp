//
//  DashboardView.swift
//  QuizApp
//
//  Created by Felix Wich on 04.12.25.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    
    @Binding var currentScreen: AppScreen
    
    @State private var showQuiz = false
    
    var body: some View {
        
        VStack{
            
            ScoreView(correctCount: 10, wrongCount: 4).padding(.bottom,40)
            
            Spacer()
            
            // Ihre Buttons...
            Button("Quiz Starten") {
                
                withAnimation {
                    currentScreen = .quiz
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
