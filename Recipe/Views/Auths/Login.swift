//
//  Login.swift
//  Recipe
//
//  Created by William Ballard on 12/1/22.
//

import SwiftUI

struct Login: View {
    
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField("email@domain.com", text: $email)
            SecureField("password", text: $password)
            Button("Login", action: {
                
            })
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
