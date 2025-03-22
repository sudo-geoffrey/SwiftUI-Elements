//
//  Buttons.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 2/27/25.
//

import SwiftUI

struct Buttons: View {
    @Environment(\.sizeCategory) var sizeCategory
    
    @State private var offsetx: Double = 0
    @State private var offsety: Double = 0
    
    var body: some View {
        VStack{
            Button("Hello"){
                print("Button pressed")
                move()
            }
            .buttonStyle(.bordered)
            .offset(x: offsetx, y: offsety)
        }
    }
    
    func move(){
        withAnimation{
            offsetx = Double.random(in: -130...130)
            offsety = Double.random(in: -300...300)
        }
    }
    
}


#Preview {
    Buttons()
}
