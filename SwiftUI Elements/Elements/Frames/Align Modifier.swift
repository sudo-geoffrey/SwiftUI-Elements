//
//  Align Modifier.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 3/7/25.
//

import SwiftUI

struct AlignModifier: ViewModifier {
    
    let alignment: Alignment
    
    init(alignment: Alignment = .center) {
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

extension View {
    func align(_ alignment: Alignment) -> some View {
        self.modifier(AlignModifier(alignment: alignment))
    }
}

struct Align_Modifier: View {
    var body: some View {
        ZStack {
                Text("Hello")
                    .align(.topLeading)
                Text("Hello")
                    .align(.top)
                Text("Hello")
                    .align(.topTrailing)
                Text("Hello")
                    .align(.leading)
                Text("Hello")
                    .align(.center)
                Text("Hello")
                    .align(.trailing)
                Text("Hello")
                    .align(.bottomLeading)
                Text("Hello")
                    .align(.bottom)
                Text("Hello")
                    .align(.bottomTrailing)
        }
        .padding()
    }
}

#Preview {
    Align_Modifier()
}
