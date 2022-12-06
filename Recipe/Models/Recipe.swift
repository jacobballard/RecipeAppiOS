//
//  Recipe.swift
//  Recipe
//
//  Created by William Ballard on 12/5/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

final class Recipe : Codable, ObservableObject {



    @Published var title : String?

    @Published var ingredients : [String]?

    @Published var instructions : [String]?

    @Published var tags : [String]?

    @Published var image : Data?

    enum CodingKeys: CodingKey {
        
        case title
        case ingredients
        case instructions
        case tags
        case image
        
    }

    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        ingredients = try container.decode([String].self, forKey: .ingredients)
        instructions = try container.decode([String].self, forKey: .instructions)
        tags = try container.decode([String].self, forKey: .tags)
        image = try container.decode(Data.self, forKey: .image)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(ingredients, forKey: .ingredients)
        try container.encode(instructions, forKey: .instructions)
        try container.encode(tags, forKey: .tags)
        try container.encode(image, forKey: .image)
        
    }
}
