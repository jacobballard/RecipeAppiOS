////
////  Recipe.swift
////  Recipe
////
////  Created by William Ballard on 12/5/22.
////
//
//import Foundation
//import SwiftUI
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//
//final class Recipe : Codable, ObservableObject, Identifiable {
//
//    @DocumentID var id : String?
//    
//    @Published var title : String?
//
//    @Published var ingredients : [String]?
//
//    @Published var instructions : [String]?
//
//    @Published var tags : [String]?
//
//    @Published var image : Data?
//
//    enum CodingKeys: CodingKey {
//        
//        case title
//        case ingredients
//        case instructions
//        case tags
//        case image
//        
//    }
//    
//    init(title : String, ingredients : [String], instructions : [String], tags : [String]) {
//        self.title = title
//        self.ingredients = ingredients
//        self.instructions = instructions
//        self.tags = tags
//        self.image = nil
//        
//    }
//    required init(from decoder: Decoder) throws {
//        
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        title = try container.decode(String.self, forKey: .title)
//        ingredients = try container.decode([String].self, forKey: .ingredients)
//        instructions = try container.decode([String].self, forKey: .instructions)
//        tags = try container.decode([String].self, forKey: .tags)
//        image = try container.decode(Data.self, forKey: .image)
//        
//    }
//    
//    public func encode(to encoder: Encoder) throws {
//        
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(ingredients, forKey: .ingredients)
//        try container.encode(instructions, forKey: .instructions)
//        try container.encode(tags, forKey: .tags)
//        try container.encode(image, forKey: .image)
//        
//    }
//}
//
//
//// For debug
//
//let testRecipes = [
//    Recipe(title: "Kimchi", ingredients: ["ONion", "Garlic", "Goruchan (?) Koren Chili Flakes", "Rice Vinegar", "Cabbage", "Raddish", "Water", "Green Onion", "Salt"], instructions: ["Mix ingredients in jar and put in fridge"], tags: ["Korean", "Side", "Sauce and Condiment"]),
//    Recipe(title: "Shepherd's Pie", ingredients: ["Lamb or Ground Beef", "Thyme", "Rosemary",  "Peas and Carrots", "Tomato Paste", "Garlic", "Onion", "Cooking oil", "Potatoes", "butten", "salt and pepper", "Flour", "Beef stock", "Red wine (optional)", "Parmesean :)"], instructions: ["Brown meat", "Add onion and garlic", "Stir in tomatoe paste", "deglaze and let beef simmer", "add spices", "make potatoes simultaneously", "mix in spices and cheese and cook in the over"  ], tags: ["English", "Dinner", "Meal"]),
//    Recipe(title: "Cereal Milk", ingredients: ["Milk", "cereal"], instructions: ["mix together and soak", "strain milk and use"], tags: ["dessert", "ingredient"])
//]
