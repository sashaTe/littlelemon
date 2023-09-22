//
//  littleLemonApp.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 01.09.2023.
//

import SwiftUI

@main
struct littleLemonApp: App {
    @StateObject private var vm = ViewModel()
    @AppStorage(kIsLoggedIn)var isLoggedIn = false
    var body: some Scene {
        
        WindowGroup {
            if !isLoggedIn {
                NavigationView {
                    Onboarding()
                        .environmentObject(vm)
                        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                }
            } else {
                Home()
            }
        }
    }
}
