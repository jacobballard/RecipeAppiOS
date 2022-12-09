//
//  SearchItemView.swift
//  Recipe
//
//  Created by William Ballard on 12/8/22.
//

import SwiftUI


struct SearchItemView: View {
    
    
    @State var data : Set = [
        SearchItem(text:"Beatles"),
        SearchItem(text:"Pearl Jam"),
        SearchItem(text:"REM"),
        SearchItem(text:"Guns n Roses"),
        SearchItem(text:"Red Hot Chili Peppers"),
        SearchItem(text:"No Doubt"),
        SearchItem(text:"Nirvana"),
        SearchItem(text:"Tom Petty and the Heart Breakers"),
        SearchItem(text:"The Eagles")
       
        ]

    // MARK: - BODY
    
    var body: some View {
        FlexibleView(
            availableWidth: UIScreen.main.bounds.width, data: data,
            spacing: 15,
            alignment: .leading
        ) { item in
            Button {
                data.remove(item)
            } label: {
                
                
                
                HStack {
                    Image(systemName: "xmark").resizable().frame(width: 8, height: 8)
                    Text(verbatim: item.text)
                }.padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.2))
                    )
                
            }
            .foregroundColor(.black)
        }
        }

}

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State var elementsSize: [Data.Element: CGSize] = [:]

    var body : some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                    content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }

    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth

        for element in data {
          let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]

          if remainingWidth - (elementSize.width + spacing) >= 0 {
            rows[currentRow].append(element)
          } else {
            currentRow = currentRow + 1
            rows.append([element])
            remainingWidth = availableWidth
          }

          remainingWidth = remainingWidth - (elementSize.width + spacing)
        }

        return rows
    }
}

struct FlexibleView_Previews: PreviewProvider {
    static var previews: some View {
        
        var data = [
            "Beatles",
            "Pearl Jam",
            "REM",
            "Guns n Roses",
            "Red Hot Chili Peppers",
            "No Doubt",
            "Nirvana",
            "Tom Petty and the Heart Breakers",
            "The Eagles"
           
            ]
        
        FlexibleView(
            availableWidth: UIScreen.main.bounds.width, data: data,
            spacing: 15,
            alignment: .leading
          ) { item in
            Text(verbatim: item)
              .padding(8)
              .background(
                RoundedRectangle(cornerRadius: 8)
                  .fill(Color.gray.opacity(0.2))
               )
          }
          .padding(.horizontal, 10)
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
          GeometryReader { geometryProxy in
            Color.clear
              .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
          }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView()
    }
}
