//
//  SnapCarousel.swift
//  WWDC2022Fiona
//
//  Created by Fiona Valencia on 21/04/22.
//

import SwiftUI

struct SnapCarousel<Content: View,T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index : Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping(T)->Content){
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    var body: some View{
        
        GeometryReader{proxy in
            
            ForEach(list){item in
                
                HStack(spacing: spacing){
                    ForEach(list){item in
                        content(item)
                    }
                }
            }
        }
    }
}

struct  SnapCarousel_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
