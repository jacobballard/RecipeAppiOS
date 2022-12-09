//
//  SearchItem.swift
//  Recipe
//
//  Created by William Ballard on 12/8/22.
//

import Foundation

struct SearchItem : Hashable {
    
    var text : String
    
    init(text : String) {
        self.text = text
    }
    
}
