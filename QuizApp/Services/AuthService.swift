//
//  AuthServices.swift
//  QuizApp
//
//  Created by Felix Wich on 03.12.25.
//

import SwiftData
import Foundation
import Combine

class AuthService: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    
    func registerUser(username: String, passwordText: String, context: ModelContext) -> Bool {
        
        // Prüfen, ob Benutzername bereits existiert (optional, aber gut)
        /*if getUser(username: username, context: context) != nil {
         print("Fehler: Benutzername ist bereits vergeben.")
         return false
         }*/
        
        // 2. Neues Benutzer-Modell erstellen
        let newUser = UserModel(username: username, passwordHash: passwordText)
        
        // 3. Im lokalen SwiftData-Speicher ablegen
        context.insert(newUser)
        
        do {
            try context.save()
            print("Benutzer \(username) erfolgreich in SwiftData registriert.")
            return true
        } catch {
            print("FEHLER beim Speichern des Benutzers: \(error)")
            return false
        }
    }
    
    func verifyLogin(username: String, passwordText: String, context: ModelContext) -> Bool {
        
        // 1. Benutzer in SwiftData suchen und gespeicherten Hash abrufen
        guard let userToVerify = getUser(username: username, context: context) else {
            print("Benutzername nicht gefunden.")
            return false
        }
        
        // 2. Eingegebenes Passwort hashen
        let enteredHash = passwordText
        
        // 3. Hashes vergleichen
        if enteredHash == userToVerify.passwordHash {
            print("Login erfolgreich!")
                  // ACHTUNG: Hier müssten Sie eine Session im Keychain speichern!
                  return true
        } else {
            print("Passwort falsch. Hash-Mismatch.")
            return false
        }
    }
    
    private func getUser(username: String, context: ModelContext) -> UserModel? {
        let predicate = #Predicate<UserModel> { $0.username == username }
        let descriptor = FetchDescriptor<UserModel>(predicate: predicate)
        
        do {
            let matchingUsers = try context.fetch(descriptor)
            return matchingUsers.first
        } catch {
            print("Fehler beim Abrufen der Benutzerdaten: \(error)")
            return nil
        }
    }
    
    func verifyLogin(username: String, passwordText: String, context: ModelContext) -> UserModel? {
        
        
        let predicate = #Predicate<UserModel>{$0.username == username}
        let descriptor = FetchDescriptor<UserModel>(predicate: predicate)
        
        do {
            let matchingUsers = try context.fetch(descriptor)
            return matchingUsers.first
        } catch {
            print("Fehler beim Abrufen der Benutzerdaten: \(error)")
            return nil
        }
        
    }
    
    
    
    
}
