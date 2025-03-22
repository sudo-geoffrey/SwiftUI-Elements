//
//  BlurEffect.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 3/8/25.
//

import SwiftUI

struct BlurEffect: View {
    @State private var mainBlurRadius: Double = 10.0
    @State private var redBlurRadius: Double = 10.0
    @State private var blueBlurRadius: Double = 10.0
    
    let blendModes: [BlendMode] = [.normal, .plusDarker, .plusLighter, .softLight, .multiply, .screen, .overlay, .darken, .lighten]
    
    @State private var selectedBlendMode: BlendMode = .normal
    
    var body: some View {
        VStack {
            // Blur Preview
            ZStack {
                LinearGradient(
                    colors: [.purple,.blue,.green,.orange],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .blur(radius: mainBlurRadius)
                
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 30))
                    .overlay{
                        Text("Blur Effects")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .padding()
                
                // Red Circle
                BlendedCircleView(color: .red, circleRadius: 200.0, offsetX: -100.0, offsetY: 100.0, blurRadius: redBlurRadius, blendMode: selectedBlendMode)
                
                // Blue Circle
                BlendedCircleView(color: .blue, circleRadius: 150.0, offsetX: 120.0, offsetY: -80.0, blurRadius: blueBlurRadius, blendMode: selectedBlendMode)
            }
            
            // Sliders
            VStack {
                HStack(spacing: 0) {
                    Text("Blend Style:")
                    Picker("Workout Type", selection: $selectedBlendMode) {
                        ForEach(blendModes, id: \.self) {blendMode in
                            Text(blendMode.description)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                SliderTextView(value: $mainBlurRadius, min: 0, max: 30, text: "Main Blur Radius", color: .black)
                SliderTextView(value: $redBlurRadius, min: 0, max: 50, text: "Red Blur Radius", color: .red)
                SliderTextView(value: $blueBlurRadius, min: 0, max: 50, text: "Blue Blur Radius", color: .blue)
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable var test: Bool = true
    BlurEffect()
}
extension BlendMode {
    var description: String {
        switch self {
        case .normal:
            return "Normal"
        case .multiply:
            return "Multiply"
        case .screen:
            return "Screen"
        case .overlay:
            return "Overlay"
        case .darken:
            return "Darken"
        case .lighten:
            return "Lighten"
        case .plusDarker:
            return "Plus-darker"
        case .plusLighter:
            return "Plus-lighter"
        case .softLight:
            return "Soft-light"
        default:
            return "Other"
        }
    }
}
