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
    @StateObject private var vm = ViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                if !UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                     Onboarding()
                        .environmentObject(vm)
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                } else {
//                    Home()
//                        .environmentObject(vm)
//                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                }
                    
            }
        }
    }
}
