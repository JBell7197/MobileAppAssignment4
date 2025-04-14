//
//  UserViewModel.swift
//  JournalApp
//
//  Created by Justin Bell on 4/9/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var users = [UserModel]()
    var isSuccessful : Bool = false
    let db = Firestore.firestore()
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error creating user: \(error)")
            } else {
                print("User created successfully!")
            }
        }
    }
    
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error signing in: \(error)")
            } else {
                print("Signed in successfully!")
            }
        }
    }
}


