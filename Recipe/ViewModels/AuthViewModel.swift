//
//  AuthViewModel.swift
//  Recipe
//
//  Created by William Ballard on 12/1/22.
//

import Foundation
import FirebaseAuth
import FirebaseAuthCombineSwift
import Combine

final class AuthViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    
    @Published var isSignedIn : Bool = false
    
    @Published var shouldVerify : Bool = false
    
    @Published var user : User? = nil
    
    private var bag = Set<AnyCancellable>()
    
    func signInWithEmail() {
        
//        Auth.auth().signIn(withEmail: email, password: password)
//            .map { $0.user }
//            .replaceError(with: nil)
//            .map { $0 != nil }
//            .assign(to: &$isSignedIn)
        
        Auth.auth().signIn(withEmail: email, password: password)
            .map { $0.user }
            .sink { [weak self] res in
                self?.isSignedIn = true
            } receiveValue: { [weak self] userIn in
                self?.user = userIn
            }
            .store(in: &bag)
    }
    
    func registerWithEmail() {
        Auth.auth().createUser(withEmail: email, password: password)
            .map { $0.user }
            .sink { [weak self] res in
                self?.isSignedIn = true
            } receiveValue: { [weak self] userIn in
                self?.user = userIn

            }
            .store(in: &bag)
            
    }
    
//    Should I make users verify email? Seems like better form but does MVP need?
//    func verifyEmail() {
//        self.user?.sendEmailVerification()
//            .map {$0}
//            .sink { [weak self] res in
//
//
//            }
//    }
    
}
