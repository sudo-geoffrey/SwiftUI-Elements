//
//  SliderTextView.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 3/22/25.
//

import SwiftUI

struct SliderTextView: View {
    @Binding var value: Double
    
    let min: Double
    let max: Double
    let text: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(text.capitalized): \(value.formatted())")
            Slider(value: $value, in: min...max, step: 1)
                .tint(color)
        }
    }

}

#Preview {
    @Previewable @State var PreviewValue: Double = 0
    SliderTextView(value: $PreviewValue, min: 0, max: 100, text: "Text goes here", color: .green )
}
