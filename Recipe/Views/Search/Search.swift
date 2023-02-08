//
//  Search.swift
//  Recipe
//
//  Created by William Ballard on 1/6/23.
//

import SwiftUI

struct Search: View {

    @EnvironmentObject private var viewModel : SearchViewModel
    @State private var isFocused: Bool = false
    @State private var searchTerm : String = ""
    var body: some View {
        NavigationView {
            ScrollView {

                SearchItemsView()


                VStack {

                    ForEach(viewModel.list ?? []) { num in
                        GroupBox {
                            Text("Test \(num.title)")
                        }
                    }

                }

            }



        }
        .searchable(text: $searchTerm)
        .onSubmit(of: .search, {
            if !self.searchTerm.isEmpty {
                viewModel.searchTerms.append(self.searchTerm)
//                self.searchTerm = ""


                DispatchQueue.main.async {
                    self.searchTerm = ""
                    print("test")
                }
            }
        })

//        .focused(isFocused, onFocusChanged: { focused in
//            isFocused = focused
//        })
            .navigationTitle("Search")
            



    }
}



struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
