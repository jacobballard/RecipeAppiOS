//
//  SearchView.swift
//  Recipe
//
//  Created by William Ballard on 12/7/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreCombineSwift
import Combine

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @State private var newSearchTerm = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Enter search term", text: $newSearchTerm)
                    
                Button(action: {
                    if !self.newSearchTerm.isEmpty {
                        self.viewModel.searchTerms.append(self.newSearchTerm.lowercased())
                        self.newSearchTerm = ""
                    }
                    
                }) {
                    Text("Add")
                }
            }
            List(viewModel.searchTerms, id: \.self) { term in
                Text(term)
            }
            List(viewModel.documents, id: \.documentID) { document in
                Text(document.data()?["name"] as? String ?? "")
            }
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
//            .environmentObject(SearchViewModel(searchTerms: []))
            
    }
}
