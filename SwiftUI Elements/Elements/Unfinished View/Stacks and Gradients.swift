//
//  Stacks and Gradients.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 2/18/25.
//

import SwiftUI

let myGradient: LinearGradient = LinearGradient(
    gradient: Gradient(colors: [Color.blue, Color.purple, Color.pink, Color.orange]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)

let myGradient2: LinearGradient = LinearGradient(
    gradient: Gradient(colors: [Color.green, Color.mint, Color.teal, Color.blue]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)

struct VStackView: View{
    @State private var number: Int = 0
    
    var body: some View {
        Text("Example of VStack:")
            .font(.title)
            .fontWeight(.bold)
            VStack (spacing: 5){
                Text("Hello, this is a VStack")
                Text("VStack stands for Vertical Stack")
                Text("It goes up to down")
                HStack {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis.rtl")
                        .foregroundStyle(.red)
                    Image(systemName: "video.badge.waveform")
                        .foregroundStyle(.green)
                    Image(systemName: "eraser.line.dashed")
                        .foregroundStyle(.blue)
                    Image(systemName: "lines.measurement.vertical")
                        .foregroundStyle(.yellow)
                }
                HStack {
                    Button("Hello"){print("Hello"); number+=1}
                        .buttonStyle(.bordered)
                        .scaleEffect(number % 2 == 0 ? 1.1 : 1.0)
                        .animation(.spring(), value: number)

                    Text(String(number))
                }
        }
        .padding()
    }
}

struct HStackView: View{
    @State private var number: Int = 0
    var body: some View {
        Text("Example of HStack:")
            .font(.title)
            .fontWeight(.bold)
        HStack(spacing: 20){
            Text("This is horizontal")
            Image(systemName: "faceid")
                .font(.title)
            Button("Press Me"){print("Hello"); number+=1}
                .buttonStyle(.bordered)
                .scaleEffect(number % 2 == 0 ? 1.1 : 1.0) // Simple animation effect
                .animation(.spring(), value: number)

            Text(String(number))
        }
        .padding()
    }
}

struct ZStackView: View {
    var body: some View {
        Text("Example of ZStack:")
            .font(.title)
            .fontWeight(.bold)
        ZStack {
            Rectangle()
                .foregroundStyle(myGradient)
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 200, height: 200)
                .overlay(alignment: .leading){Text("Z=2").padding()
                        .foregroundStyle(.white)
                        .font(.title)
                }

            Rectangle()
                .foregroundStyle(myGradient2)
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 150, height: 100)
                .overlay(){Text("Z=1") .foregroundStyle(.white)
                    .font(.title)}
                .offset(x: 30, y:30)

        }
        .padding()
    }
}

struct Stacks_and_Gradients: View {
    var body: some View {
        VStack {
            VStack {
                VStackView()
                HStackView()
                ZStackView()
            }
            Spacer()
        }
    }
}

#Preview {
    Stacks_and_Gradients()
}
