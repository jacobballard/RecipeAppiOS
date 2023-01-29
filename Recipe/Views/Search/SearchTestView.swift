////
////  SearchTestView.swift
////  Recipe
////
////  Created by William Ballard on 12/19/22.
////
//
//import SwiftUI
//
//struct SearchTestView: View {
//    @State private var scrollHeight : CGFloat? = nil
//    @State private var headerHeight : CGFloat? = nil
//    @State private var searchFieldHeight : CGFloat? = nil
//    @State private var ingredientsHeight : CGFloat? = nil
//    
//    @State private var searchTerm : String = ""
//    @EnvironmentObject var viewModel : SearchViewModel
//    
//    
//    var body: some View {
//        
//            
//            ZStack {
////
//                
//                
//                GeometryReader { geoProxy in
//                    
//                    ScrollView {
////                        GeometryReader { geoProxy in
////                            Color.clear.preference(key: OffsetKey.self, value: geoProxy.frame(in: .global).origin.y)
////                                .frame(height: 0)
////
////
////                        }.onPreferenceChange(OffsetKey.self) { (value : OffsetKey.Value) in
////                            scrollHeight = value
////    //                        print(value ?? "none")
////                        }
////                        .frame(height: 0)
//                        
////                        Color.clear
////                            .frame(height: 0)
////                            .frame(maxHeight: 0)
////                            .padding(0)
////                            .background(GeometryReader { gp -> Color in
////                            DispatchQueue.main.async {
////                                self.scrollHeight = gp.frame(in: .global).origin.y
////                                print("Search height \(gp.frame(in: .global).origin.y)")
////                            }
////
////                                return Color.clear
////
////                        })
//                        
//                        ForEach(0..<30) { num in
//                            GroupBox {
//                                Text("\(num)")
//                            } label: {
//                                Text("Tets")
//                            }
//                                
//                                
//                            
//                            
//                        }
//                        .offset(y : 150)
//                        
//                        
//                        VStack(spacing: 0) {
//                            
//                            VStack(spacing: 0) {
//                                Text("Search").font(.title)
//                                    .bold()
//                                    .padding(.top, 25)
//                                GeometryReader { gProxy in
//                                    
//                                    VStack {
//                                        
//                                        
//                                        VStack {
//                                            ZStack {
//                                                HStack {
//                                                    Image(systemName: "magnifyingglass")
//                                                    
//                                                    TextField("Search", text: $searchTerm)
//                                                        .onSubmit {
//                                                            guard searchTerm.isEmpty == false else { return }
//                                                            
//                                                            viewModel.searchTerms.insert(searchTerm, at: viewModel.searchTerms.count)
//                                                        }
//                                                        .lineLimit(1)
//                                                    
//                                                }
//                                                .padding(.bottom, (((headerHeight ?? 0) - (searchFieldHeight ?? 0) - (ingredientsHeight ?? 0)) / 2))
//                                                .underlineTextField()
//                                                .background(GeometryReader { gp -> Color in
//                                                    DispatchQueue.main.async {
//                                                        self.searchFieldHeight = gp.size.height
//                                                        print("Search height \(gp.size.height)")
//                                                    }
//                                                    
//                                                    return Color.clear
//                                                })
//                                                
//                                            }
//                                            //                                .padding()
//                                            //                                .background(Color(.systemGray5), alignment: .center)
//                                        }
//                                        
//                                        
//                                        if viewModel.searchTerms.count > 0 {
//                                            
//                                            GeometryReader { searchProxy in
//                                                SearchItemsView()
//                                                    .padding([.leading], 10)
//                                                    .background(GeometryReader { gp -> Color in
//                                                        DispatchQueue.main.async {
//                                                            print("Ingredient height \(gp.size.height)")
//                                                            self.ingredientsHeight = gp.size.height
//                                                        }
//                                                        
//                                                        return Color.clear
//                                                    })
//                                            }
//                                        }
//                                    }
//                                    
//                                    
//                                    
//                                    Color.clear.preference(key: HeaderKey.self, value: gProxy.frame(in: .global).height)
//                                        .frame(height: 0)
//                                }
//                            }
//                            
//                            .background(GeometryReader { gp -> Color in
//                                DispatchQueue.main.async {
//                                    print("Ingredient height \(gp.size.height)")
//                                    self.scrollHeight = gp.frame(in: .global).maxY
//                                    print("SH \(String(describing: self.scrollHeight))")
//                                }
//                                
//                                return Color.clear
//                            })
//                            
//                            .frame(maxWidth: .infinity)
//                            .frame(height: CGFloat(150) - getHeight())
//                            .offset(x: 0, y : self.getHeaderOffset())
//                            .background(Color.orange.opacity(0.25))
//                            
//                            
//                            
//                            
//                        }
////                        .edgesIgnoringSafeArea(.all)
////                        .padding(.top, CGFloat(150) - getHeight())
////                        .background(GeometryReader { gp -> Color in
////                        DispatchQueue.main.async {
////                            self.scrollHeight = gp.frame(in: .global).origin.y
////                            print("Search height \(gp.frame(in: .global).origin.y)")
////                        }
////
////                            return Color.clear
////
////                    })
//                    }
//                    
//                    
//                    
//                    
//                    
//                }.onPreferenceChange(HeaderKey.self) { (value : OffsetKey.Value) in
//                    headerHeight = value
////                    print(value ?? "none")
//                }
//                
//            }
//            .edgesIgnoringSafeArea(.vertical)
//            
//            
//        
//        
//    }
//    
//    func getHeaderOffset() -> CGFloat {
//        if let scrollHeight = scrollHeight {
//            
//            
//            if scrollHeight < 150 {
//                return abs(scrollHeight)
//            } else {
//                return (CGFloat(-1) * (scrollHeight - CGFloat(150)))
//            }
//        }
//        
//        return CGFloat(0)
//    }
//    
//    func getHeight() -> CGFloat {
//        print("header height \(String(describing: headerHeight?.description))")
//        if let scrollHeight = scrollHeight {
//            print(scrollHeight.description)
//            let x = Float(scrollHeight)
//            if x <= 0 && x >= -70 {
//                return CGFloat(abs(x))
//            } else if x < -70 {
//                return CGFloat(70)
//            }
//        }
//        return CGFloat(0)
//    }
//    
//    func getOpacity() -> Double {
//        
//        if let scrollHeight = scrollHeight  {
//            let x = Float(scrollHeight)
//            if x >= -30 && x <= 0 {
//                return Double(1 - abs(x)/30)
//            } else if x < -30 {
//                return 0
//            } else {
//                return 1
//            }
//        }
//        return 1
//    }
//}
//
//extension View {
//    func underlineTextField() -> some View {
//        self
////            .padding(.vertical, 10)
//            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
//            .foregroundColor(.black)
//            .padding([.leading,.trailing,.top], 10)
////            .padding(.v)
//            
//    }
//}
//struct OffsetKey: PreferenceKey {
//    static let defaultValue: CGFloat? = nil
//    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
//        value = value ?? nextValue()
//    }
//}
//
//struct HeaderKey: PreferenceKey {
//    static let defaultValue: CGFloat? = nil
//    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
//        value = value ?? nextValue()
//    }
//}
//
//struct SearchTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchTestView().environmentObject(SearchViewModel())
//    }
//}
