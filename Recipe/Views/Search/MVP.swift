////
////  MVP.swift
////  Recipe
////
////  Created by William Ballard on 1/23/23.
////
//
//import SwiftUI
//
//struct MVP: View {
//    
//    @EnvironmentObject var viewModel : SearchViewModel
//    @State var searchTerm : String = ""
//    
//    var body: some View {
//        NavigationStack {
//            
//            ScrollView {
//                VStack {
//                    
//                    SearchItemsView()
//                    
//                    ForEach(0..<30) { num in
//                        GroupBox {
//                            Text("\(num)")
//                        }
//                    }
//                }
//            }.navigationTitle("Search")
//            
//        }
//            .searchable(text: $searchTerm)
//            .onSubmit(of: .search) {
//                print("SUBMIT!!")
//                guard searchTerm.isEmpty == false else { return }
//                
//                viewModel.searchTerms.insert(searchTerm, at: viewModel.searchTerms.count)
//            
//            }
//    }
//}
//
//struct MVP_Previews: PreviewProvider {
//    static var previews: some View {
//        MVP()
//    }
//}
