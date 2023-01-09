//
//  SearchItem.swift
//  Recipe
//
//  Created by William Ballard on 12/8/22.
//

import Foundation

struct SearchItem : Hashable, Identifiable {
    
    var id = UUID()
    
    var index : Int
    var text : String
    
    init(text : String, index : Int) {
        self.text = text
        self.index = index
        
    }
    
}
