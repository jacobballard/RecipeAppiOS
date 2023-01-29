////
////  Search.swift
////  Recipe
////
////  Created by William Ballard on 1/6/23.
////
//
//import SwiftUI
//
//struct Search: View {
//    
//    @State private var searchTerm : String = ""
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                
//                SearchItemsView()
//                
//                
//                VStack {
//                    
//                    ForEach(0..<30) { num in
//                        GroupBox {
//                            Text("Test \(num)")
//                        }
//                    }
//                    
//                }
//                
//            }
//            
//            
//        }.searchable(text: $searchTerm)
//            .navigationTitle("Search")
//    }
//}
//
//struct Search_Previews: PreviewProvider {
//    static var previews: some View {
//        Search()
//    }
//}
