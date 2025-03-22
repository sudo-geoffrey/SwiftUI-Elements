//
//  Frames.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 3/7/25.
//

import SwiftUI

// Frame refferse to where the view is places in the parent view (.infinity means to the edge of the parent view)

struct Frames: View {
    var body: some View {
        ZStack{
            Text("Top Leading")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            Text("Top")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            Text("Top Trailing")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            Text("Leading")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            Text("Center")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Text("Trailing")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            Text("Bottom Leading")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            Text("Bottom")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            Text("Bottom Trailing")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            
        }
        .font(.headline)
        .bold()
        .padding()
    }
}

#Preview {
    Frames()
}
