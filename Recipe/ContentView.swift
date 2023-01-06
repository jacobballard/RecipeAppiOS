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
        
        SearchTestView().environmentObject(SearchViewModel(searchTerms: [
            SearchItem(text:"Beatles"),
            SearchItem(text:"Pearl Jam"),
            SearchItem(text:"REM"),
            SearchItem(text:"Guns n Roses"),
            SearchItem(text:"Red Hot Chili Peppers"),
            SearchItem(text:"No Doubt"),
            SearchItem(text:"Nirvana"),
            SearchItem(text:"Tom Petty and the Heart Breakers"),
            SearchItem(text:"The Eagles")

            ]))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
