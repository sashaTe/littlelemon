//
//  Home.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 05.09.2023.
//

import SwiftUI

struct Home: View {
    @AppStorage(kFirstName) var firstName: String = "no name"
    @AppStorage(kLastName) var lastName  : String = "no lastname"
    @AppStorage(kEmail) var email        : String = "no email"
    var body: some View {
        TabView {
         Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
        UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
//        .onAppear {UserDefaults.standard.synchronize()}
//        .navigationTitle(firstName + " " + lastName )
        .navigationBarBackButtonHidden()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Home(firstName: "Pavel", lastName: "Durov", email: "@email")
        }
    }
}
