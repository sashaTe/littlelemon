//
//  SwiftUIView.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 01.09.2023.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var isLoggedIn = false
    
    @State private var isActive = false
    
    @EnvironmentObject private var vm: ViewModel
    
    var isInfoEntered: Bool {return !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty}
    
    var body: some View {
        VStack(spacing: 20){
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("E-mail", text: $email)
            
            
            Button {
                guard isInfoEntered else {return}
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                    UserDefaults.standard.set(true, forKey: kIsLoggedIn)
//                    UserDefaults.standard.synchronize()
                    isLoggedIn = true
//                    isActive = true
            } label: {
                Text("Register")
            }
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
            .opacity(isInfoEntered ? 1.0 : 0.3)
            
            NavigationLink(destination: Home(
                firstName: UserDefaults.standard.string(forKey: kFirstName) ?? "no name🫣",
                lastName: UserDefaults.standard.string(forKey: kLastName) ?? "no lastname🫣",
                email: UserDefaults.standard.string(forKey: kEmail) ?? "no email"
            ), isActive: $isLoggedIn) {
                EmptyView()
            }
        }
        .padding(.horizontal)
        .onAppear {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                firstName = ""
                lastName = ""
                email = ""
            }
        }
    }
    
}


struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Onboarding()
        }
    }
}
