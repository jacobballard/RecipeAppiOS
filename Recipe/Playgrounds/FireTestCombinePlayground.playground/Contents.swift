import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

FirebaseApp.configure()
let db = Firestore.firestore()

let ingredients = ["egg", "milk"]
let recipesRef = Firestore.firestore().collection("recipes")
recipesRef.whereField("plain_ingredients", arrayContains: ingredients[0]).whereField("plain_ingredients", arrayContains: ingredients[1]).getDocuments { (querySnapshot, error) in
    if let error = error {
        print("Error getting documents: \(error)")
    } else {
        for document in querySnapshot!.documents {
            print("\(document.documentID) => \(document.data())")
        }
    }
}
