//
//  SearchViewModel.swift
//  Recipe
//
//  Created by William Ballard on 12/8/22.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

class SearchViewModel : ObservableObject {


    @Published var searchTerms  : [SearchItem] = [SearchItem]()

    @Published var list : [Recipe]?

    private var db = Firestore.firestore()

    private var bag = Set<AnyCancellable>()
    
    init(searchTerms: [SearchItem], list: [Recipe]? = nil) {
        self.searchTerms = searchTerms
        self.list = list
    }

    // Get subset of recipes
    func search_recipes(contains : [String] ) {

//        db
//        .collection("recipes")
//        .whereField("ingredients", arrayContains: contains)
//        .snapshotPublisher()
//        .sink { _ in
//        } receiveValue: { querySnapshot in
//            // Need to perfect recipe model
//
//            self.list = querySnapshot.documents.compactMap({ document -> Recipe? in
//                try? document.data(as: Recipe.self)
//            })
//
//            // update list
//
//        }
//        .store(in: &bag)


        // More clear?
        db
        .collection("recipes")
        .whereField("ingredients", arrayContains: contains)
        .snapshotPublisher()
        .map { querySnapshot in
            querySnapshot.documents.compactMap { document in
                try? document.data(as: Recipe.self)
            }
        }
        .sink { result in
            switch result {
            case .finished:
                print("yay")
            case let .failure(error):
                print("\(error.localizedDescription)")
            }
        } receiveValue: { [weak self] recipes in
            guard let self = self else { return }

            self.list = recipes
        }
        .store(in: &bag)


//        db
//        .collection("recipes")
//        .whereField("ingredients", arrayContains: contains)
//        .snapshotPublisher()
//        .map { querySnapshot in
//            querySnapshot.documents
//        }.compactMap { documents in
//            self.list = documents.compactMap { document -> Recipe? in
//                try? document.data(as: Recipe.self)
//            }
//        }

    }


}
