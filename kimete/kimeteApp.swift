//
//  kimeteApp.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/16.
//

import SwiftUI

@main
struct kimeteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
    1
