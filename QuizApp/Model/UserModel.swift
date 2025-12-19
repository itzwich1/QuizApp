//
//  UserModel.swift
//  QuizApp
//
//  Created by Felix Wich on 03.12.25.
//

import SwiftData
import Foundation

@Model
final class UserModel{
    
    @Attribute(.unique) var username: String
    
    var passwordHash: String
    
    init(username: String, passwordHash: String){
        self.username = username
        self.passwordHash = passwordHash
    }
}
