//
//  RandomGridView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/17.
//

import SwiftUI
import WaterfallGrid

struct Symbol: Identifiable {
    var id = UUID()
    var image: String
    var name: String
}

struct RectangleView: View {
//    var color: Color
    let image: Image
    let textTitle: String
        
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.red)
                .frame(width:100, height: 100)
            Text("\(textTitle)")
                .font(.title)
            Image(systemName: "pencil.circle")
            image
        }
    }
}

struct RandomGridView: View {
    var body: some View {

        WaterfallGrid((0..<3), id: \.self) { index in
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
        }
        .frame(height: 400)
    }
}

struct RandomGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                RandomGridView()
                RectangleView(
                    image: Image(systemName: "pencil.circle"),
                    textTitle: "testTitle です")
            }
        }
    }
}
