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
        VStack(spacing: 0){
            Image("Logo")
                .frame(height: 50)
            ScrollView {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.theme.accent)
                        .frame(height: 320)
                        VStack(alignment: .leading) {
                            Text("Little Lemon")
                                .font(Font.custom("Georgia", size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.theme.yellow)
                                
                            Text("Chicago")
                                .font(Font.custom("Georgia", size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.theme.white)
                                HStack {
                                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                        .font(Font.custom("Georgia", size: 18))
                                        .frame(width: 200, height: 150)
                                        .foregroundColor(.theme.white)
                                    
                                    RoundedRectangle(cornerRadius: 18)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 150, height: 150, alignment: .top)
                                        
                                        .overlay {
                                            Image("Hero image")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                        }
                                        .clipShape(Rectangle())
                                    .cornerRadius(18)
                                
                                }
                                .padding(.bottom)
    //                      MARK: SEARCHBAR

                            
                            
                        }
                        .padding(.leading)

                          
                    
                   
                }
                .padding(.bottom)
              
                VStack(spacing: 30) {
                    TextField("First Name*", text: $firstName)
                        .padding(.leading)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1)
                                .frame(height: 40)
                                .foregroundColor(.theme.gray)
                        }
                    TextField("Last Name*", text: $lastName)
                        .padding(.leading)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1)
                                .frame(height: 40)
                                .foregroundColor(.theme.gray)
                        }
                    TextField("E-mail*", text: $email)
                        .textInputAutocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding(.leading)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(lineWidth: 1)
                                        .frame(height: 40)
                                        .foregroundColor(.theme.gray)
                                }
                                .onDisappear{print("onboarding dissapear")}
                }
                .padding(.horizontal)
                
                
                Button {
                    guard isInfoEntered else {return}
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        
                        isLoggedIn = true
                        
                } label: {
                    Text("Register")
                        .foregroundColor(.theme.accent)
                        .font(Font.system(size: 16, weight: .medium))
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                
                .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.theme.yellow)
                )
                .padding(.horizontal)
                .padding(.top, 50)
                
                .opacity(isInfoEntered ? 1.0 : 0.3)
             
                NavigationLink(destination: Home(
                    firstName: UserDefaults.standard.string(forKey: kFirstName) ?? "no name🫣",
                    lastName: UserDefaults.standard.string(forKey: kLastName) ?? "no lastname🫣",
                    email: UserDefaults.standard.string(forKey: kEmail) ?? "no email"
                ), isActive: $isLoggedIn) {
                }
                Spacer()
            }
            }
        .navigationBarHidden(true)
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
