//
//  ContentView.swift
//  Recipe
//
//  Created by William Ballard on 11/27/22.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var user : UserModel
    
    var body: some View {
//        if user.isSignedIn {
//            // Home View
//        } else {
//            Login()
//        }
        
        SearchTestView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
