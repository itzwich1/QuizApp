//
//  QuestionModel.swift
//  QuizApp
//
//  Created by Felix Wich on 08.12.25.
//

import SwiftData
import Foundation

enum QuestionCategory: String, CaseIterable, Codable {
    case computer = "Computer"
    case mathe = "Mathe"
}

@Model
final class QuestionModel{
    
    @Attribute(.unique) var id: UUID
    
    var questionText: String
    var options: [String]
    var correctAnswer: String
    var categoryStr: String
    
    
    @Transient
    var category: QuestionCategory {
        get { QuestionCategory(rawValue: categoryStr) ?? .computer }
        set { categoryStr = newValue.rawValue }
    }
    
    init(questionText: String, options: [String], correctAnswer: String, category: QuestionCategory) {
        self.id = UUID()
        self.questionText = questionText
        self.options = options
        self.correctAnswer = correctAnswer
        self.categoryStr = category.rawValue
    }
}
