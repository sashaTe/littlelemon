//
//  Home.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 05.09.2023.
//

import SwiftUI

struct Home: View {
    @Environment(\.presentationMode) var presentation
    @AppStorage(kFirstName) var firstName: String = "no name"
    @AppStorage(kLastName) var lastName  : String = "no lastname"
    @AppStorage(kEmail) var email        : String = "no email"
    @AppStorage(kIsLoggedIn) var isLoggedIn: Bool = false
    @State private var selectedTab = "menu"
    
    
    let persistence = PersistenceController.shared
    var body: some View {
//        TabView(selection: $selectedTab) {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
//                .onAppear {
//                    UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "arrow.backward")
//                    
//                    UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
//                    
//                }
                .navigationBarBackButtonHidden()
        
//                .tabItem {
//                    Label("Menu", systemImage: "list.dash")
//                }
//                .tag("menu")
//
//        UserProfile()
//                .tabItem {
//                    Label("Profile", systemImage: "square.and.pencil")
//                }
//                .tag(1)
//        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Home(firstName: "Pavel", lastName: "Durov", email: "@email")
        }
    }
}
