//
//  SearchHeaderView.swift
//  Recipe
//
//  Created by William Ballard on 12/13/22.
//

import SwiftUI

struct SearchHeaderView: View {
    
    var searchTerm : Binding<String>
    
    @EnvironmentObject var viewModel : SearchViewModel
    
    var body: some View {
        
        GeometryReader { geoProxy in
            VStack {
            
                
                
                ZStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                        
                        TextField("Search again", text: searchTerm)
                    }
                }
                .padding()
                .background(Color(.systemGray5), alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 10).background(Color(.systemGray2))).foregroundColor(.white)
                
                
                if viewModel.searchTerms.count > 0 {
                    SearchItemsView()
                }
            }
        }.padding()
    }
}


struct SearchHeaderStatePreview : View {
    @State var searchTerm = ""
    
    var body : some View {
        
        SearchHeaderView(searchTerm: $searchTerm)
        
    }
}

struct SearchHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHeaderStatePreview().environmentObject(SearchViewModel(searchTerms: [
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
