//
//  UserProfile.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 20.09.2023.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.dismiss) private var dismiss
    @AppStorage(kFirstName) var firstName: String = "no name"
    @AppStorage(kLastName)  var lastName : String = "no lastname"
    @AppStorage(kEmail)     var email    : String = "no email"
    @AppStorage(kIsLoggedIn)var isLoggedIn = true
    
    @State private var back = false
    
    
    @State var checkedOrderStatus = true
    @State var checkedPasswordChanges = true
    @State var checkedSpecialOffers = true
    @State var checkedNewsletters = true
    
    
    var body: some View {
       VStack {
           HStack {
               Button {
                  dismiss()
               } label: {
                   Image(systemName: "arrow.backward.circle.fill")
                       .resizable()
                       .frame(width: 35, height: 35)
               }
               NavigationLink("", destination: Onboarding(), isActive: $back)
                   .transition(.move(edge: .leading))
               Spacer()
               Image("Logo")
               Spacer()
               Image("profile-image-placeholder")
                   .resizable()
                   .frame(width: 50, height: 50)
           }
           .padding([.leading, .trailing])
           
               ScrollView {
                   VStack(alignment: .leading, spacing: 10) {
                     Group {
                         Text("Personal information")
                               .font(.callout)
                               .fontWeight(.bold)
                               .frame(maxWidth: .infinity, alignment: .leading)
                               .padding(.bottom, 1)
                               
                           Text("Avatar")
                               .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                               .bold()
                               
                        }
                     .padding(.horizontal)
                       
                       HStack {
                           Image("profile-image-placeholder")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 100, height: 100)
                              .padding(.horizontal,10)
                              .padding(.top, 0)
                              
                           Button("Change") {

                           }
                           .font(.callout)
                           .padding()
                           .background(
                            RoundedRectangle(cornerRadius: 10)
                             
                             .fill(Color.theme.accent)
                           )
                           
                           .foregroundColor(.theme.white)
                           .padding(.trailing)
                           Button("Remove") {

                           }
                           .font(.callout)
                           .padding()
                           
                           .background(
                           RoundedRectangle(cornerRadius: 10)
                            
                            .stroke(lineWidth: 1)
                            .fill(Color.theme.accent)
                           )
                           .foregroundColor(.theme.accent)
                       }
                       
                       Group {
                           Text("First name")
                               .foregroundColor(Color.theme.gray)
                               .bold()
                               .padding(.horizontal, 20)
                           
                           Text(firstName)
                               .padding(10)
                               .frame(maxWidth: .infinity, alignment: .leading)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 5)
                                       .stroke(Color.theme.gray, lineWidth: 1)
                               )
                               .padding(.horizontal, 20)
                           
                           Text("Last name")
                               .foregroundColor(Color.theme.gray)
                               .bold()
                               .padding(.horizontal, 20)
                           
                           Text(lastName)
                               .padding(10)
                               .frame(maxWidth: .infinity, alignment: .leading)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.theme.gray, lineWidth: 1)
                               )
                               .padding(.horizontal, 20)
                           
                           Text("Email")
                               .foregroundColor(Color.theme.gray)
                               .bold()
                               .padding(.horizontal, 20)
                           
                           Text(email)
                               .padding(10)
                               .frame(maxWidth: .infinity, alignment: .leading)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.theme.gray, lineWidth: 1)
                               )
                               .padding(.horizontal, 20)
                           
                           Text("Phone number")
                               .foregroundColor(Color.theme.gray)
                               .bold()
                               .padding([.leading, .trailing], 20)
                           
                           Text("(532) 456-7890")
                               .padding(10)
                               .frame(maxWidth: .infinity, alignment: .leading)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.theme.gray, lineWidth: 1)
                               )
                               .padding([.leading, .trailing], 20)
                           
                       }
                       // Notifications
                       Group {
                           Text("Email notifications")
                               .font(Font.system(size: 18, weight: .bold))
                               .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                               .padding([.leading, .trailing], 20)
                               .padding(.top, 10)
                               .padding(.bottom, 5)
                           HStack{
                               Image(systemName: checkedOrderStatus ? "checkmark.square.fill" : "square")
                                   .foregroundColor(checkedOrderStatus ? (Color(red: 73/255, green: 94/255, blue: 87/255)) : Color.secondary)
                                   .onTapGesture {
                                       self.checkedOrderStatus.toggle()
                                   }
                               Text("Order statuses")
                                   .foregroundColor(.theme.special)
                           }
                           .padding([.leading, .trailing], 20)
                           .padding([.top, .bottom], 5)
                           HStack{
                               Image(systemName: checkedPasswordChanges ? "checkmark.square.fill" : "square")
                                   .foregroundColor(checkedPasswordChanges ? (Color(red: 73/255, green: 94/255, blue: 87/255)) : Color.secondary)
                                   .onTapGesture {
                                       self.checkedPasswordChanges.toggle()
                                   }
                               Text("Password changes")
                                   .foregroundColor(.theme.special)
                           }
                           .padding([.leading, .trailing], 20)
                           .padding([.top, .bottom], 5)
                           HStack{
                               Image(systemName: checkedSpecialOffers ? "checkmark.square.fill" : "square")
                                   .foregroundColor(checkedSpecialOffers ? (Color(red: 73/255, green: 94/255, blue: 87/255)) : Color.secondary)
                                   .onTapGesture {
                                       self.checkedSpecialOffers.toggle()
                                   }
                               Text("Special offers")
                                   .foregroundColor(.theme.special)
                           }
                           .padding([.leading, .trailing], 20)
                           .padding([.top, .bottom], 5)
                           HStack{
                               Image(systemName: checkedNewsletters ? "checkmark.square.fill" : "square")
                                   .foregroundColor(checkedNewsletters ? Color.theme.accent : Color.theme.gray)
                                   .onTapGesture {
                                       self.checkedNewsletters.toggle()
                                   }
                               Text("Newsletter")
                                   .foregroundColor(.theme.special)
                           }
                           .padding([.leading, .trailing], 20)
                           .padding([.top, .bottom], 5)
                       }
                     }
                   Button("Logout") {
                       isLoggedIn = false
                        back = true
                   }
                   .font(Font.system(size: 16, weight: .bold))
                   .frame(maxWidth: .infinity)
                   .padding(.vertical, 10)
                   .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                   .background(Color(red: 244/255, green: 206/255, blue: 20/255))
                   .cornerRadius(7)
                   .padding(20)
                   
                   HStack {
                       Button("Discard changes") {
                       }
                       .font(Font.system(size: 16, weight: .medium))
                       .foregroundColor(Color.theme.accent)
                       .frame(width: 150, height: 40)
                       .overlay(
                           RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.theme.accent, lineWidth: 1)
                           )
                       
                       Button("Save changes") {
                       }
                       .font(Font.system(size: 16, weight: .medium))
                       .foregroundColor(Color.theme.white)
                       .frame(width: 150, height: 40)
                       .background(Color.theme.accent)
                       .cornerRadius(7)
                       .padding(10)
                   }
               }
   
           
           Spacer()
        }
       .navigationBarBackButtonHidden()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
