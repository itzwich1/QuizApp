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
                questionText: "Welches Bauteil gilt als das Gehirn eines Computers und führt Berechnungen durch?",
                options: ["Festplatte", "RAM", "CPU (Prozessor)", "Grafikkarte"],
                correctAnswer: "CPU (Prozessor)",
                category: .computer
            )
            
            let q2 = QuestionModel(
                questionText: "Wofür steht die Abkürzung RAM?",
                options: ["Read Access Memory", "Random Access Memory", "Run All Memory", "Real Active Memory"],
                correctAnswer: "Random Access Memory",
                category: .computer
            )
            
            let q3 = QuestionModel(
                questionText: "Was ist KEIN Eingabegerät?",
                options: ["Maus", "Tastatur", "Monitor", "Mikrofon"],
                correctAnswer: "Monitor",
                category: .computer
            )
            
            let q4 = QuestionModel(
                questionText: "Aus welchen Ziffern besteht der Binärcode?",
                options: ["1 und 2", "0 und 1", "0 bis 9", "Nur 1"],
                correctAnswer: "0 und 1",
                category: .computer
            )
            
            let q5 = QuestionModel(
                questionText: "Was ist die Hauptaufgabe einer IP-Adresse?",
                options: ["Sie speichert Passwörter", "Sie identifiziert Geräte im Netzwerk", "Sie macht das Internet schneller", "Sie schützt vor Viren"],
                correctAnswer: "Sie identifiziert Geräte im Netzwerk",
                category: .computer
            )
            
            let q6 = QuestionModel(
                questionText: "Was ist 3 + 4?",
                options: ["6", "7", "10", "2"],
                correctAnswer: "7",
                category: .mathe
            )
            
            
            context.insert(q1)
            context.insert(q2)
            context.insert(q3)
            context.insert(q4)
            context.insert(q5)
            context.insert(q6)
            
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
    
    
    // In QuestionService.swift
    
    static func deleteAllQuestions(context: ModelContext) {
        do {
            // 1. Wir definieren, was wir suchen (Alle QuestionModels)
            let descriptor = FetchDescriptor<QuestionModel>()
            
            // 2. Wir holen die Liste aller Fragen
            let allQuestions = try context.fetch(descriptor)
            
            // 3. Sicherheitscheck: Wenn nichts da ist, hören wir auf
            if allQuestions.isEmpty {
                print("Datenbank ist bereits leer.")
                return
            }
            
            // 4. Schleife durch alle Fragen und jede einzelne löschen
            for question in allQuestions {
                context.delete(question)
            }
            
            // 5. Wichtig: Die Löschung dauerhaft speichern
            try context.save()
            print("Erfolgreich \(allQuestions.count) Fragen gelöscht.")
            
        } catch {
            print("Fehler beim Löschen der Fragen: \(error)")
        }
    }
    
}

