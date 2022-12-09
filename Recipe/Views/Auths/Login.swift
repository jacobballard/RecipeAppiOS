//
//  Login.swift
//  Recipe
//
//  Created by William Ballard on 12/1/22.
//

import SwiftUI

struct Login: View {
    
//    @EnvironmentObject var user : UserModel
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
//            Text("Login").font(.system(size: 32))
            Spacer()
            
            
            TextField("email@domain.com", text: $email).padding()
            
            SecureField("password", text: $password).padding()
            
            Button(action: {
//                user.signInWithEmail(email: email, password: password)
            }) {
                Text("Log In")
            }.padding().background(Color(.systemBlue)).foregroundColor(.white)
            Spacer()
        }.padding()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
