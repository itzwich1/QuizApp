//
//  QuizGameView.swift
//  QuizApp
//
//  Created by Felix Wich on 10.12.25.
//


import SwiftUI
import SwiftData

struct QuizGameView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss // Um das Quiz zu beenden
    
    @Binding var currentScreen: AppScreen
    
    var category: QuestionCategory
    
    // Das ViewModel als StateObject einbinden
    @StateObject private var viewModel = QuizViewModel()
    
    var body: some View {
        VStack {
            
            if viewModel.isGameOver {
                // --- END SCREEN ---
                GameResultView(score: viewModel.sessionCorrectAnswers, total: 10, onRestart: {
                    viewModel.startQuiz(context: modelContext, category: category)
                }, onClose: {
                    dismiss()
                    viewModel.saveFinalScore(context: modelContext)
                    withAnimation {
                        currentScreen = .dashboard
                    }
                })
                
            } else if let question = viewModel.currentQuestion {
                
                // Header (Frage X von Y - Score)
                HStack {
                    Text("Frage \(viewModel.questionNumber)")
                        .bold()
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Punkte: \(viewModel.sessionCorrectAnswers)")
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding()
                
                Spacer()
                
                // Die Frage
                Text(question.questionText)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: 380)
                // Animations-Effekt beim Wechsel
                    .id("QuestionText" + question.questionText)
                
                Spacer()
                
                // Die Antwort-Buttons
                // Tipp: Auch die Optionen mischen wir hier, damit "Antwort A" nicht immer oben ist!
                VStack(spacing: 12) {
                    ForEach(question.options.shuffled(), id: \.self) { option in
                        Button(action: {
                            withAnimation {
                                viewModel.selectAnswer(option)
                            }
                        }) {
                            Text(option)
                                .font(.body)
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(getButtonColor(option: option))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        // Button deaktivieren, wenn schon eine Antwort gewählt wurde
                        .disabled(viewModel.selectedAnswer != nil)
                        .frame(maxWidth: 380)
                    }
                }
                .padding()
                
                Spacer()
                
            } else {
                // Ladezustand oder Fehler (keine Fragen da)
                ContentUnavailableView("Keine Fragen gefunden", systemImage: "exclamationmark.triangle", description: Text("Bitte füge erst Fragen in der Datenbank hinzu.")).foregroundStyle(.white)
                Button("Zurück") { dismiss()
                    withAnimation {
                        currentScreen = .dashboard
                    }}.foregroundColor(.white)
            }
        }
        .onAppear {
            // Startet das Quiz, sobald die View sichtbar wird
            viewModel.startQuiz(context: modelContext, category: category)
        }
    }
    
    // Hilfsfunktion für die Button-Farben (Feedback)
    func getButtonColor(option: String) -> Color {
        // Wenn noch nichts gewählt wurde: Blau
        guard let selected = viewModel.selectedAnswer else { return .blue }
        
        // Wenn DIESER Button der gewählte war:
        if option == selected {
            // War es richtig? Grün. Sonst Rot.
            return viewModel.isCorrect == true ? .green : .red
        }
        
        // Optional: Zeige immer die richtige Antwort an (in Grün), auch wenn man falsch lag
        if let currentQ = viewModel.currentQuestion, option == currentQ.correctAnswer {
            return .green.opacity(0.6) // Leicht transparent
        }
        
        // Alle anderen Buttons grau machen
        return .gray.opacity(0.5)
    }
}

// --- Kleiner Ergebnis-Screen ---
struct GameResultView: View {
    let score: Int
    let total: Int
    let onRestart: () -> Void
    let onClose: () -> Void
    
    
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "trophy.fill")
                .font(.system(size: 80))
                .foregroundColor(.yellow)
            
            Text("Quiz beendet!")
                .font(.largeTitle)
                .bold()
            
            Text("Du hast \(score) Punkte erreicht.")
                .font(.title2)
            
            HStack(spacing: 20) {
                Button("Beenden", action: onClose)
                    .buttonStyle(.bordered)
                
                Button("Neustart", action: onRestart)
                    .buttonStyle(.borderedProminent)
            }
            .padding(.top)
        }
    }
}
