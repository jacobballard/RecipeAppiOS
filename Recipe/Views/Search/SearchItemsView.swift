//
//  SearchItemsView.swift
//  Recipe
//
//  Created by William Ballard on 12/8/22.
//

import SwiftUI

struct SearchItemsView: View {
    
    @EnvironmentObject var viewModel : SearchViewModel
    
    var body: some View {
        
        
        
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
            
                HStack(spacing: 5) {
                    ForEach(viewModel.searchTerms) { item in
                        Button {
    
                            // MARK : UPDATE
                            if let index = viewModel.searchTerms.firstIndex(of: item) {
                                viewModel.searchTerms.remove(at: index)
                            }
                        } label: {
    
    
    
                            HStack {
                                Image(systemName: "xmark").resizable().frame(width: 8, height: 8)
                                Text(verbatim: item.text)
                            }.padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.gray.opacity(0.2))
                                )
                                .id(item.id)
    
                        }
                        .foregroundColor(.black)
                    }
                    .onChange(of: viewModel.searchTerms.count) { _ in
                        withAnimation {
                            value.scrollTo(viewModel.searchTerms[viewModel.searchTerms.count - 1].id, anchor: .trailing)
                        }
                    }
                }
    
            }
        }
//
    }
}



struct SearchItemsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemsView().environmentObject(SearchViewModel(searchTerms: [
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
