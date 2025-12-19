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
    @Binding var selectedCategory: QuestionCategory
    
    @State private var showQuiz = false
    
    var body: some View {
        
        VStack{
            
            ScoreView().padding(.bottom,40)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Wähle eine Kategorie:")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Picker("Kategorie", selection: $selectedCategory) {
                    ForEach(QuestionCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(.menu) // Das macht es zum Dropdown/Menu Stil
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
            .padding()
            
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
