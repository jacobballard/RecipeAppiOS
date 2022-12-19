//
//  SearchView.swift
//  Recipe
//
//  Created by William Ballard on 12/7/22.
//

import SwiftUI

struct SearchView: View {
    
//    @EnvironmentObject var recipeList : RecipeList
    @EnvironmentObject var viewModel : SearchViewModel
    
    @State private var currentTerm : String = ""
    
    
    var body: some View {
        
        ScrollView {
            ZStack {
                VStack {
                    ForEach(0..<30) { item in
                        GroupBox {
                            
                            VStack(alignment: .leading) {
                                Text("Jacqueline \(item)")
                                
                            }
                            
                            
                            
                        } label: {
                            Text("Item").font(.title2)
                        }
                    }
                }
                .padding(.top, 180)

//                GeometryReader { geoProxy in
//                    SearchHeaderView(searchTerm: $currentTerm)
//                }
//                .frame(maxWidth: .infinity)
//                .frame(height: self.)
                
                GeometryReader { geoProxy in
                    VStack {
                        Text("Search").font(.title2).bold()
                        SearchHeaderView(searchTerm: $currentTerm)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: self.getHeight(minHeight: 80,
                                                        maxHeight: 80,
                                                        yOffset: geoProxy.frame(in: .global).origin.y))
                    
                    .background(Color.orange.opacity(0.95))
                    .offset(y: (geoProxy.frame(in: .global).origin.y < 0 ? abs(geoProxy.frame(in: .global).origin.y) : -geoProxy.frame(in: .global).origin.y))
                }
            
            
        }
        .edgesIgnoringSafeArea(.vertical)
            
        }
        //.searchable(text: $currentTerm, placement: .toolbar)
        
        
//        NavigationView {
//            ScrollView {
//                VStack {
//                    SearchItemsView()
//
//                    LazyVStack {
//                        ForEach(0..<100) { number in
//                            Text("\(number)")
//                        }
//                    }
//                }
//            }
//        }.searchable(text: $currentTerm)
        
//            Text("dang")
            
        
        
    }
    
    func getHeight(minHeight: CGFloat, maxHeight: CGFloat, yOffset: CGFloat) -> CGFloat {
        // scrolling up
        if maxHeight + yOffset < minHeight {
            return minHeight
        }
        
        // scrolling down
        return maxHeight + yOffset
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(SearchViewModel(searchTerms: [
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
//            .environmentObject(SearchViewModel(searchTerms: []))
            
    }
}
