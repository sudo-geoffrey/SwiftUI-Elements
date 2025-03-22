import SwiftUI

struct Grids: View {
    @State var redRectPressed: Bool = false
    var body: some View {
        ZStack {
            
            Grid {
                GridRow{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.red)
                        .gridCellColumns(redRectPressed ? 3 : 1)
                        .onTapGesture{
                            withAnimation(.spring){
                                redRectPressed.toggle()
                            }
                        }
                        .overlay{
                            Text("Press Me")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                    if !redRectPressed {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.orange)
                            .gridCellColumns(1)

                        RoundedRectangle(cornerRadius: 10)
                            .fill(.yellow)
//                            .overlay {
//                                Button("Hello") {
//                                    print("Button pressed")
//                            }
//                                .buttonStyle(.bordered)
//                                .foregroundStyle(myGradient)
//                        }
                        .gridCellColumns(1)
                    }

                }
                GridRow{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.mint)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.teal)
                }
                GridRow{
                    Grid {
                        GridRow {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hue: 0.55, saturation: 0.8, brightness: 0.6)) // Dark Cerulean
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hue: 0.57, saturation: 0.75, brightness: 0.55)) // Deep Steel Blue
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hue: 0.58, saturation: 0.7, brightness: 0.5)) // Dark Cyan
                        }
                        GridRow {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hue: 0.56, saturation: 0.85, brightness: 0.52)) // Slate Blue
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hue: 0.58, saturation: 0.78, brightness: 0.45)) // Muted Dark Teal
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hue: 0.57, saturation: 0.9, brightness: 0.48)) // Shadow Blue
                        }
                    }
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.indigo)
                        .gridCellColumns(2)
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    Grids()
}
