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
    @State var buttonText = "Start"
    @State var totalGrids = 2;
    
    var body: some View {
        ZStack{
            Color.MyTheme.offWhite
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    WaterfallGrid((0..<totalGrids), id: \.self) { rectangle in
                        RoundedRectangleView()
                            .padding(20) // TODO: padding が当たらない
                    }
                    .frame(height: 400)
                    .gridStyle(
                        columnsInPortrait: 4, // 行数
                        columnsInLandscape: 4, // TODO: 要確認
                        spacing: 4
                    )
                    .scrollOptions(direction: .horizontal)
                    .padding(EdgeInsets(top: 6, leading: 8, bottom: 16, trailing: 8))
                }
                
                Text("count:\(totalGrids)")
                
                Button(action: {
                    buttonText = "Button Tapped"
                }){
                    Text(buttonText)
                        .font(.largeTitle)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: 250, height: 60, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
                
                Spacer()
                    .frame(height: 20)
                
                HStack{
                    Button(action: {
                        totalGrids = totalGrids + 1
                    }){
                        Text("増やす")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: 80, height: 28, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    Button(action: {
                        if (totalGrids > 0) {
                            totalGrids = totalGrids - 1
                        }
                    }){
                        Text("減らす")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: 80, height: 28, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                }
            }
        }
    }
}

struct RandomGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                RectangleView(
                    image: Image(systemName: "pencil.circle"),
                    textTitle: "testTitle です")
            }
        }
    }
}
