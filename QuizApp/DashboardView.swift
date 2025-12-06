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
    
    var body: some View {
        
        VStack{
            
            
            
            ScoreView(correctCount: 10, wrongCount: 4).padding(.bottom,40)
            
            Spacer()
            
            // Ihre Buttons...
            Button("Quiz Starten") { /* ... */ }
                .padding()
            
        }
        
    }
    
}
