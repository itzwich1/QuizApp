//
//  QuestionService.swift
//  QuizApp
//
//  Created by Felix Wich on 08.12.25.
//

import SwiftData
import Foundation

class QuestionService{
    
    
    //Generiert standardfragen beim ersten mal starten der App
    static func generateDefaultQuestions(context: ModelContext){
        
        let descriptor = FetchDescriptor<QuestionModel>()
        
        do {
            let existingQuestions = try context.fetch(descriptor)
            
            
            if existingQuestions.count > 0 {
                print("Default Fragen bereits generiert")
                return
            }
            
            let q1 = QuestionModel(
                questionText: "Was ist die Hauptstadt von Deutschland?",
                options: ["München", "Hamburg", "Berlin", "Köln"],
                correctAnswer: "Berlin",
                category: "Geografie"
            )
            
            let q2 = QuestionModel(
                questionText: "Wie viele Beine hat eine Spinne?",
                options: ["6", "8", "4", "10"],
                correctAnswer: "8",
                category: "Biologie"
            )
            
            
            context.insert(q1)
            context.insert(q2)
            
            try context.save()
            print("Fragen erfolgreich gespeichert!")
            
        } catch {
            print("Fehler beim Prüfen oder Speichern: \(error)")
        }
        
    }
    
    static func addQuestion(question: QuestionModel, context: ModelContext) -> Bool {
        
        context.insert(question)
        
        do {
            try context.save()
            print("Frage erfolgreich gespeichert: \(question.questionText)")
            return true
        } catch {
            print("Fehler beim Speichern der Frage: \(error)")
            // Optional: Hier könnte man den Insert rückgängig machen, falls nötig,
            // aber SwiftData handhabt fehlgeschlagene Saves meist, indem die Änderungen im Context verbleiben.
            return false
        }
    }
    
    
}

