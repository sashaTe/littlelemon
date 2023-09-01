//
//  littleLemonApp.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 01.09.2023.
//

import SwiftUI

@main
struct littleLemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
