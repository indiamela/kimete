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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
