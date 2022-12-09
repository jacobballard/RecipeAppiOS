//
//  User.swift
//  Recipe
//
//  Created by William Ballard on 12/4/22.
//

import Foundation
import FirebaseAuth
import FirebaseAuthCombineSwift
import Combine

final class UserModel : ObservableObject {
    
    @Published var username : String = ""
    
    @Published var realName : String = ""
    
    @Published var isSignedIn : Bool = false
    
    private var bag = Set<AnyCancellable>()
    
    private var user : User?
    
    init() {
        
        // call change listener
        print("test")
//        Auth.auth().authStateDidChangePublisher()
//            .sink { result in
//
//
//                self.user = result ?? nil
//
//                if self.user == nil {
//                    self.isSignedIn = false
//
//                } else {
//                    self.isSignedIn = true
//                }
//            }
//            .store(in: &bag)
    }
    
    func signInWithEmail(email : String, password : String) {
        
        Auth.auth().signIn(withEmail: email, password: password)
            .sink(
                receiveCompletion: { [weak self] result in
                
                    switch result {
                        case .finished:
                            self?.isSignedIn = true
                        case .failure(_):
                            print("failed to sign in")
                }
                }, receiveValue: { [weak self] valueUser in
                    self?.user = valueUser.user
                })
            .store(in: &bag)
    }
    
    func registerWithEmail(email : String, password : String) {
        
        Auth.auth().createUser(withEmail: email, password: password)
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .finished:
                    self?.isSignedIn = true
                    // could make this verify instead
                case .failure(_):
                    print("failed to register")
                }
            }, receiveValue: { [weak self] valueUser in
                self?.user = valueUser.user
            })
            .store(in: &bag)
    }
}
