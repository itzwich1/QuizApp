//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Felix Wich on 08.12.25.
//

//
//  QuizView.swift
//  QuizApp
//
//  Created by Felix Wich on 08.12.25.
//

import SwiftUI
import SwiftData
import Combine

class QuizViewModel: ObservableObject {
    
    // --- ZUSTANDSVARIABLEN (STATE) ---
    @Published var currentQuestion: QuestionModel?
    @Published var score: Int = 0
    @Published var questionNumber: Int = 1
    @Published var isGameOver: Bool = false
    
    // Um Feedback zu geben (Button grün/rot färben)
    @Published var selectedAnswer: String? = nil
    @Published var isCorrect: Bool? = nil
    
    // Interne Liste der gemischten Fragen
    private var questions: [QuestionModel] = []
    private var currentIndex: Int = 0
    
    // --- FUNKTIONEN ---
    
    // 1. Spiel starten: Fragen holen und mischen
    func startQuiz(context: ModelContext) {
        do {
            // Wir holen ALLE Fragen
            let descriptor = FetchDescriptor<QuestionModel>()
            let allQuestions = try context.fetch(descriptor)
            
            if allQuestions.isEmpty { return }
            
            // WICHTIG: Hier passiert der Zufall!
            // Wir mischen (.shuffled) und nehmen z.B. nur die ersten 10 (.prefix)
            self.questions = Array(allQuestions.shuffled().prefix(10))
            
            // Reset aller Werte
            self.score = 0
            self.currentIndex = 0
            self.questionNumber = 1
            self.isGameOver = false
            self.selectedAnswer = nil
            
            // Setze die erste Frage
            if let first = questions.first {
                self.currentQuestion = first
            }
            
        } catch {
            print("Fehler beim Laden der Fragen: \(error)")
        }
    }
    
    // 2. Antwort prüfen
    func selectAnswer(_ answer: String) {
        guard let question = currentQuestion, selectedAnswer == nil else { return } // Verhindert Mehrfachklicks
        
        selectedAnswer = answer
        
        if answer == question.correctAnswer {
            score += 1
            isCorrect = true
        } else {
            isCorrect = false
        }
        
        // Kurze Verzögerung, damit der Nutzer sieht ob es richtig war, dann nächste Frage
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.nextQuestion()
        }
    }
    
    // 3. Nächste Frage laden
    private func nextQuestion() {
        currentIndex += 1
        
        if currentIndex < questions.count {
            // Es gibt noch Fragen
            currentQuestion = questions[currentIndex]
            questionNumber += 1
            
            // Reset für die neue Runde
            selectedAnswer = nil
            isCorrect = nil
        } else {
            // Keine Fragen mehr -> Spielende
            isGameOver = true
        }
    }
}

