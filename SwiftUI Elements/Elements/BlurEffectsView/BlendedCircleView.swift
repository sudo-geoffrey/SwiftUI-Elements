//
//  BlendedCircleView.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 3/22/25.
//

import SwiftUI

struct BlendedCircleView: View {
    let color: Color
    let circleRadius: Double
    let offsetX: Double
    let offsetY: Double
    let blurRadius: Double
    let blendMode: BlendMode
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: circleRadius, height: circleRadius)
            .offset(x: offsetX, y: offsetY)
            .blur(radius: blurRadius)
            .blendMode(blendMode)
        
    }
}

#Preview {
    BlendedCircleView(color: .red, circleRadius: 50.0, offsetX: 100.0, offsetY: -100.0, blurRadius: 10.0, blendMode: .normal)
}
