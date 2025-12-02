//
//  ContentView.swift
//  QuizApp
//
//  Created by Felix Wich on 02.12.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        ZStack{
            Image("Hintergrund")
                            .resizable() // Macht das Bild skalierbar
                            .aspectRatio(contentMode: .fill) // Füllt
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .ignoresSafeArea()
        VStack {
            Image("IconApp").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
            
            
            Button("Login"){
                
            }
            .padding().background(Color.blue).foregroundColor(.white).cornerRadius(10)
            
            
        }
        .padding()
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
