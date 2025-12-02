//
//  Item.swift
//  QuizApp
//
//  Created by Felix Wich on 02.12.25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
