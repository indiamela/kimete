//
//  RandomGridView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/17.
//

import SwiftUI

struct RandomGridView: View {
    var body: some View {
        Text("RandomGridView")
            .navigationBarTitle("NavigationBar", displayMode: .automatic)
            .navigationBarItems(trailing:Button(action: {
                
            }, label: {
                Image(systemName: "line.horizontal.3")
            }))
    }
}

struct RandomGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RandomGridView()
        }
    }
}
