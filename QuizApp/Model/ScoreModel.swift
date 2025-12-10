//
//  ScoreModel.swift
//  QuizApp
//
//  Created by Felix Wich on 10.12.25.
//

import SwiftData
import Foundation

@Model
final class ScoreModel{
    
    var wrongAnswers: Int
    var correctAnswers: Int
    
    init(wrongAnswers: Int, correctAnswers: Int){
        self.wrongAnswers = wrongAnswers
        self.correctAnswers = correctAnswers
    }
    
    
}
