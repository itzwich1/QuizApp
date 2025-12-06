//
//  ScoreView.swift
//  QuizApp
//
//  Created by Felix Wich on 06.12.25.
//

import SwiftUI

struct ScoreView: View {
    // Diese Werte übergeben Sie später von außen (z.B. aus der Datenbank)
    var correctCount: Int
    var wrongCount: Int
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Statistik")
                .font(.title2) // Etwas größer als normaler Text
                .bold()
                .padding(.horizontal).foregroundColor(.white)
            
            // --- LINKES FELD: RICHTIG ---
            VStack {
                Text("Richtig")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("\(correctCount)")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.green)
            }
            .padding()
            .frame(maxWidth: 380)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            // --- RECHTES FELD: FALSCH ---
            VStack {
                Text("Falsch")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("\(wrongCount)")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.red)
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
