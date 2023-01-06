//
//  SearchTestView.swift
//  Recipe
//
//  Created by William Ballard on 12/19/22.
//

import SwiftUI

struct SearchTestView: View {
    @State private var scrollHeight : CGFloat? = nil
    
    @State private var searchTerm : String = ""
    
    
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
                    VStack {
                        
                        Color.clear.preference(key: OffsetKey.self, value: geoProxy.frame(in: .global).minY)
                            .frame(height: 0)
                        Text("Search").font(.title)
                            .bold()
                            
                        SearchHeaderView(searchTerm: $searchTerm).opacity(getOpacity())
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 180 - getHeight())
                    .background(Color.orange.opacity(0.25))
                    
                    
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
        SearchTestView()
    }
}
