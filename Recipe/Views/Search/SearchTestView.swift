//
//  SearchTestView.swift
//  Recipe
//
//  Created by William Ballard on 12/19/22.
//

import SwiftUI

struct SearchTestView: View {
    @State private var scrollHeight : CGFloat? = nil
    @State private var headerHeight : CGFloat? = nil
    @State private var searchTerm : String = ""
    @EnvironmentObject var viewModel : SearchViewModel
    
    
    var body: some View {
        
            
            ZStack {
//
                ScrollView {
                    GeometryReader { geoProxy in
                        Color.clear.preference(key: OffsetKey.self, value: geoProxy.frame(in: .global).minY)
                            .frame(height: 0)
                    }.onPreferenceChange(OffsetKey.self) { (value : OffsetKey.Value) in
                        scrollHeight = value
                        print(value ?? "none")
                    }
                    VStack {
                        ForEach(0..<30) { num in
                            GroupBox {
                                VStack {
                                    Text("test")
                                        .bold()
                                        
                                    Text("\(num)")
                                        .foregroundColor(.secondary)
                                }
                            } label: {
                                Text("test").font(.title2)
                            }
                            .padding(.top, 5)
                            .shadow(radius: 10)
                        }
                        
                    }
                    .padding(.top, 180 - getHeight())
                }
                
                GeometryReader { geoProxy in
                    VStack(spacing: 0) {
                        
                        
                        Text("Search").font(.title)
                            .bold()
                            
                        VStack {
                            ZStack {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                    
                                    TextField("Search", text: $searchTerm).onSubmit {
                                        guard searchTerm.isEmpty == false else { return }
                                        
                                        viewModel.searchTerms.insert(SearchItem(text: searchTerm, index: viewModel.searchTerms.count))
                                    }
                                }
                            }
                            .padding()
                            .background(Color(.systemGray5), alignment: .center)
                        }.padding([.leading, .trailing])
                            .padding(.bottom, 5)
                        
                        if viewModel.searchTerms.count > 0 {
                            SearchItemsView().padding([.leading])
                        }
                        
                        
                            
                            
                        Color.clear.preference(key: HeaderKey.self, value: geoProxy.frame(in: .global).maxY)
                            .frame(height: 0)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 150 - getHeight())
                    .background(Color.orange.opacity(0.25))
                    
                    
                    
                }.onPreferenceChange(HeaderKey.self) { (value : OffsetKey.Value) in
                    headerHeight = value
                    print(value ?? "none")
                }
                
            }
            .edgesIgnoringSafeArea(.vertical)
            
            
        
        
    }
    
    func getHeight() -> CGFloat {
        if let scrollHeight = scrollHeight {
            let x = Float(scrollHeight)
            if x <= 0 && x >= -70 {
                return CGFloat(abs(x))
            } else if x < -70 {
                return CGFloat(70)
            }
        }
        return CGFloat(0)
    }
    
    func getOpacity() -> Double {
        
        if let scrollHeight = scrollHeight  {
            let x = Float(scrollHeight)
            if x >= -30 && x <= 0 {
                return Double(1 - abs(x)/30)
            } else if x < -30 {
                return 0
            } else {
                return 1
            }
        }
        return 1
    }
}

struct OffsetKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

struct HeaderKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

struct SearchTestView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTestView().environmentObject(SearchViewModel())
    }
}
