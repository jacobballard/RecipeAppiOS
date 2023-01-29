////
////  SearchItemsView.swift
////  Recipe
////
////  Created by William Ballard on 12/8/22.
////
//
//import SwiftUI
//
//struct SearchItemsView: View {
//    
//    @EnvironmentObject var viewModel : SearchViewModel
//    
//    
//    
//    var body: some View {
//        
//        
//        
//        ScrollViewReader { value in
//            ScrollView(.horizontal, showsIndicators: false) {
//            
//                HStack(spacing: 5) {
//                    ForEach(viewModel.searchTerms.sorted(by: {$0 <= $1})) { item in
//                        Button {
//    
//                            // MARK : UPDATE
//                            viewModel.searchTerms.remove(item)
//                          
//                        } label: {
//    
//    
//    
//                            HStack {
//                                Image(systemName: "xmark").resizable().frame(width: 8, height: 8)
//                                Text(verbatim: item.text)
//                            }.padding(8)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 8)
//                                        .fill(Color.gray.opacity(0.2))
//                                )
//                                .id(item.id)
//    
//                        }
//                        .foregroundColor(.black)
//                    }
////                    .onChange(of: viewModel.searchTerms.count) { _ in
////                        withAnimation {
////                            value.scrollTo(viewModel.searchTerms[viewModel.searchTerms.count - 1].id, anchor: .trailing)
////                        }
////                    }
//                }
//    
//            }
//        }
////
//    }
//}
//
//
//
//struct SearchItemsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchItemsView()
//    }
//}
