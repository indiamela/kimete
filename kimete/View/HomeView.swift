//
//  ContentView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/16.
//

import SwiftUI
import CoreData

struct HomeView: View {
    init() {
        // 背景色を指定
        UITabBar.appearance().barTintColor = UIColor.black
        // 選択していないアイテム色を指定
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    var body: some View {
        TabView{
            NavigationView{
                RandomGridView()
            }
            .tabItem {
                Image(systemName: "square.grid.3x3.bottomright.fill")
            }
            NavigationView {
                RouletteView()
            }
            .tabItem {
                Image(systemName: "circles.hexagonpath.fill")
            }
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
            }
        }
        .accentColor(Color.MyTheme.redColor)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
