//
//  sampleView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/10/05.
//

import SwiftUI
import Neumorphic

struct RouletteContentView: View {
    let symbols:[Item]
    @State var isAnimation = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.Neumorphic.main)
                .softOuterShadow()

            WheelShape(symbols)
                .stroke(
                    Color.Neumorphic.darkShadow, lineWidth: 1.5)
                .overlay(
                    annotations.foregroundColor(Color.gray))
                .rotationEffect(Angle(degrees: self.isAnimation ? 360 * 10 : 0))
                .onAppear() {
                    withAnimation(
                        Animation
                            .linear(duration: 1)
                            .repeatForever(autoreverses: false)) {
                                self.isAnimation.toggle()
                    }
                }
        }
        .frame(height: 300, alignment: .center)
    }
    
    var annotations : some View {
        ZStack {
            let theta = CGFloat(2) * .pi / CGFloat(symbols.count)
            GeometryReader { geo in
                let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
                let radius = min(geo.size.width / 2, geo.size.height / 2) / 1.5
                ForEach(0..<symbols.count, id: \.self) { index in
                    let offset = theta * CGFloat(index) + theta / 2
                    // place SF Symbol, offset to center, then the radius
                    Text(symbols[index].name ?? "")
                        .offset(x: center.x, y: center.y)
                        .offset(x: radius * cos(offset), y: radius * sin(offset))
                        .frame(alignment: .center)
                        .offset(x: -10, y: -10) // fudge factor to center symbol in wedge
                }
            }
        }
    }

    struct WheelShape: Shape {
        let symbols : [Item]
        
        init(_ symbols: [Item]) {
            self.symbols = symbols
        }
        
        func path(in rect: CGRect) -> Path {
            // center of the shape we are drawing in
            let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
            let radius = min(rect.size.width / 2, rect.size.height / 2)
            // each angle offset in radians
            let theta = CGFloat(2) * .pi / CGFloat(symbols.count)
            var path = Path()
            
            // enumerate the array so index is available
            symbols.enumerated().forEach({ (index, symbol) in
                let offset = theta * CGFloat(index)
                path.move(to: center)
                path.addLine(to: CGPoint(x: radius * cos(offset) + center.x, y: radius * sin(offset) + center.y))
            })
            
            return path
        }
    }
}
//struct RouletteContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        RouletteContentView()
//    }
//}

//struct ContentView: View {
//
//    @State var isAnimation = false
//
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 8)
//                .frame(width: 200, height: 120, alignment: .center)
//                .foregroundColor(Color.gray)
//
//            VStack {
//                Spacer()
//                Circle()
//                    .trim(from: 0, to: 0.6)
//                    .stroke(AngularGradient(gradient: Gradient(colors: [.gray, .white]), center: .center),
//                            style: StrokeStyle(
//                                lineWidth: 8,
//                                lineCap: .round,
//                                dash: [0.1, 16],
//                                dashPhase: 8))
//
//                    .frame(width: 48, height: 48)
//                    .rotationEffect(Angle(degrees: self.isAnimation ? 360 : 0))
//                    .onAppear() {
//                        withAnimation(
//                            Animation
//                                .linear(duration: 1)
//                                .repeatForever(autoreverses: false)) {
//                                    self.isAnimation.toggle()
//                        }
//                }
//
//                Text("読み込み中")
//                    .foregroundColor(.white)
//                    .font(.system(size: 12, weight: .medium, design: .rounded))
//                    .lineLimit(1)
//                    .padding(.top)
//                Spacer()
//            }
//        }
//    }
//}
