////
////  DemoView.swift
////  Recipe
////
////  Created by William Ballard on 12/14/22.
////
//
//import SwiftUI
//
//struct DemoView: View {
//    
//    @State var te : String = ""
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                
//                VStack {
//                    SearchItemsView()
//                    ForEach(0..<100) { count in
//                        Text("\(count)")
//                    }
//                }
//            }
//        }.searchable(text: $te)
//    }
//}
//
//struct DemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        DemoView()
//    }
//}
