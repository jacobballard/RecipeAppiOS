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

    @Published var documents: [DocumentSnapshot] = []
    
    @Published var searchTerms  : [String] = []

    @Published var list : [Recipe]?

    private var db = Firestore.firestore()

    private var cancellable : Set<AnyCancellable> = Set<AnyCancellable>()
    
   
    
    init(list: [Recipe]? = nil) {
        self.searchTerms = searchTerms
        self.list = list
        
        $searchTerms
                    .removeDuplicates()
                    .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
                    .sink(receiveValue: { val in
                        print("Dobences? \(val)")
                        self.fetchData { docs in
                            print("Yay \(docs)")
                        }
                        self.search_recipes(contains: self.searchTerms)
                        
                    })
                    
                    .store(in: &cancellable)
    }
    
    func queryWithFilters(filters: [String]) -> Query {
        var query : Query = Firestore.firestore().collection("recipes")

      for filter in filters {
          query = query.whereField("plain_ingredients", arrayContains: filter)
      }

      return query
    }

    func fetchData(completion: @escaping ([DocumentSnapshot]) -> Void) {
      let query = queryWithFilters(filters: searchTerms)

      query.getDocuments { (querySnapshot, error) in
        if let error = error {
          print("Error getting documents: \(error)")
          completion([])
          return
        }

        completion(querySnapshot!.documents)
      }
    }
//    func fetchData() {
//        var query : Query = db.collection("recipes")
//
//
//        print("terms")
//        print(searchTerms)
////        query = query.whereField("plain_ingredients", arrayContains: searchTerms)
//
//        for term in searchTerms {
//            query = query.whereField("plain_ingredients", arrayContains: term)
//        }
//
//        query.getDocuments { (snapshot, error) in
//
//        }
//
//
//        query.addSnapshotListener { (snapshot, error) in
//            if let error = error {
//                print("bob")
//                print(error)
//            } else {
//
//                self.documents = snapshot?.documents ?? []
//                print(self.documents.description)
//            }
//        }
//    }


    
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
        .whereField("plain_ingredients", arrayContains: contains)
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
            print("receive Value \(recipes)")
            self.list = recipes
            print(self.list ?? [])
        }
        .store(in: &cancellable)
        
        


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
