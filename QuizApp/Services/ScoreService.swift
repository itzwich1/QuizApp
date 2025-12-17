//
//  ScoreService.swift
//  QuizApp
//
//  Created by Felix Wich on 10.12.25.
//

import SwiftData
import Foundation

class ScoreService {
    
    /// Speichert die Ergebnisse einer Spielrunde.
    /// Prüft automatisch, ob bereits ein Gesamt-Score existiert und aktualisiert diesen,
    /// anstatt immer neue Einträge zu erzeugen.
    static func updateScore(newCorrect: Int, newWrong: Int, context: ModelContext) {
        
        // 1. Versuch, den bestehenden Score zu laden
        let descriptor = FetchDescriptor<ScoreModel>()
        
        do {
            let results = try context.fetch(descriptor)
            
            if let existingScore = results.first {
                // FALL A: Es gibt schon einen Eintrag -> Wir addieren die neuen Punkte drauf
                print("Update existing Score: +\(newCorrect) Richtig, +\(newWrong) Falsch")
                existingScore.correctAnswers += newCorrect
                existingScore.wrongAnswers += newWrong
                
            } else {
                // FALL B: Die Datenbank ist leer -> Wir legen den allerersten Eintrag an
                print("Erstelle neuen Score-Eintrag")
                let newScore = ScoreModel(
                    wrongAnswers: newWrong,
                    correctAnswers: newCorrect
                )
                context.insert(newScore)
            }
            
            // 2. Speichern bestätigen
            try context.save()
            print("Score erfolgreich im Service gespeichert!")
            
        } catch {
            print("CRITICAL ERROR im ScoreService: \(error)")
        }
    }
}
