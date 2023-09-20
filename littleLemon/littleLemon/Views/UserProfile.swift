//
//  UserProfile.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 20.09.2023.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @AppStorage(kFirstName) var firstName: String = "no name"
    @AppStorage(kLastName) var lastName  : String = "no lastname"
    @AppStorage(kEmail) var email        : String = "no email"
    
    
    var body: some View {
       VStack {
            Text("Personal information")
           
            Image("profile-image-placeholder")
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: 200)
           
           Text(firstName)
           Text(lastName)
           Text(email)
           
           Button("Logout") {
               UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
               self.presentation.wrappedValue.dismiss()
           }
           .padding(.top, 50)
           Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
