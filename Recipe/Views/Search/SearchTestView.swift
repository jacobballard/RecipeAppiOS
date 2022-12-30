//
//  SearchTestView.swift
//  Recipe
//
//  Created by William Ballard on 12/19/22.
//

import SwiftUI

struct SearchTestView: View {
    var body: some View {
        ZStack {
            
            ScrollView {
                GeometryReader { geoProxy in
                    Color.clear.preference(key: OffsetKey.self, value: geometry.frame(in: .global).minY)
                        .frame(height: 0)
                }
                
                ForEach(0..<30) {num in
                    GroupBox {
                        HStack {
                            VStack {
                                Text("test")
                                Text("\(num)")
                            }
                        }
                    }
                }
            }
            
            
        }
    }
}

struct OffsetKey: PreferenceKey {
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
