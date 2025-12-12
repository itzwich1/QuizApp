//
//  ScoreService.swift
//  QuizApp
//
//  Created by Felix Wich on 10.12.25.
//

import SwiftData
import Foundation

class ScoreService{
    
    
    static func saveScore(score: ScoreModel, context: ModelContext) -> Bool{
        
        print(score.wrongAnswers)
        print(score.correctAnswers)
        
        context.insert(score)
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
        
    }
}
