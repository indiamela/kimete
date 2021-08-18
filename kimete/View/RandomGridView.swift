//
//  RandomGridView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/17.
//

import SwiftUI

struct Symbol: Identifiable {
    var id = UUID()
    var image: String
    var name: String
}

struct RandomGridView: View {
    var body: some View {
        
        // TODO Symbol の記法について要確認 背景色つけるには？
        let symbols = [Symbol(image: "drop.fill", name: "drop"),
                           Symbol(image: "flame.fill", name: "flame"),
                           Symbol(image: "bolt.fill", name: "bolt"),
                           Symbol(image: "leaf.fill", name: "leaf"),
                           Symbol(image: "hare.fill", name: "hare"),
                           Symbol(image: "tortoise.fill", name: "tortoise")
        ]
        
        let columns: [GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 150))]
        
        // TODO LazyVStack 以外にも UI コンポーネントは色々あるため要調査
        LazyVStack {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(symbols) { symbol in
                            VStack {
                                Image(systemName: symbol.image)
                                Text(symbol.name)
                            }
                        }
                    }
                    .padding()
            
            Group{
                Button(action: {
                    print("START ボタンが押された！")
                }) {
                    Image(systemName: "arrowtriangle.forward.fill")
                        .foregroundColor(Color.black)
                    Text("START")
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(24)
            }
        }

        


//        Text("RandomGridView")
//            .navigationBarTitle("NavigationBar", displayMode: .automatic)
//            .navigationBarItems(trailing:Button(action: {
//
//            }, label: {
//                Image(systemName: "line.horizontal.3")
//            }))
    }
}

struct RandomGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RandomGridView()
        }
    }
}
