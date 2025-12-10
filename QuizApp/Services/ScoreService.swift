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
        
        context.insert(score)
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
        
    }
}
