//
//  QuestionModel.swift
//  QuizApp
//
//  Created by Felix Wich on 08.12.25.
//

import SwiftData
import Foundation

@Model
final class QuestionModel{
    
    @Attribute(.unique) var id: UUID
    
    var questionText: String
    var options: [String]
    var correctAnswer: String
    var category: String
    
    init(questionText: String, options: [String], correctAnswer: String, category: String) {
        self.id = UUID()
        self.questionText = questionText
        self.options = options
        self.correctAnswer = correctAnswer
        self.category = category
    }
}
