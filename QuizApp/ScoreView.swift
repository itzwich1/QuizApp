//
//  ScoreView.swift
//  QuizApp
//
//  Created by Felix Wich on 06.12.25.
//

import SwiftUI
import SwiftData

struct ScoreView: View {
    
    @Query private var scores: [ScoreModel]
    
    //Erfolgsquote ausrechnen
    var quote: Double {
        if score.wrongAnswers <= 0 {
            return Double(score.correctAnswers)
        } else {
            return Double(score.correctAnswers) / Double(score.wrongAnswers)
        }
    }
    
    
    private var score: ScoreModel {
        if let existingScore = scores.first {
            return existingScore
        } else {
            // Fallback: Ein leeres Model anzeigen, falls die DB leer ist (damit die App nicht abstürzt)
            return ScoreModel(wrongAnswers: 0, correctAnswers: 0)
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Statistik")
                .font(.title2) // Etwas größer als normaler Text
                .bold()
                .padding(.horizontal).foregroundColor(.white)
            
            VStack {
                Text("Richtig")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("\(score.correctAnswers)")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.green)
            }
            .padding()
            .frame(maxWidth: 380)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            VStack {
                Text("Falsch")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("\(score.wrongAnswers)")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.red)
            }
            .padding()
            .frame(maxWidth: 380)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            VStack {
                
                Text("Erfolgsquote")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("\(String(format: "%.2f", quote))")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: 380)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
        .padding(.horizontal)
    }
}
