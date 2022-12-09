//
//  RecipeCellView.swift
//  Recipe
//
//  Created by William Ballard on 12/8/22.
//

import SwiftUI

struct RecipeCellView: View {
    
    var recipe : Recipe
    
    var body: some View {
        HStack {
            
            Text(recipe.title)
            
            
        }
    }
}

struct RecipeCellView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCellView(recipe: Recipe(title: "test", ingredients: ["cook"], instructions: ["cook"], tags: ["english", "mexican"]))
    }
}
