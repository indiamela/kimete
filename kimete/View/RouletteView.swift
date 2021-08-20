//
//  RouletteView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/17.
//

import SwiftUI

struct RouletteView: View {
    var body: some View {
        Text("RouletteView")
            .toolbar {
                NavigationLink(
                    destination: GroupsView(),
                    label: {
                        Image(systemName: "line.horizontal.3")
                    })
            }
    }
}

struct RouletteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RouletteView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
