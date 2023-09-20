//
//  Menu.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 05.09.2023.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("LittleLemon")
                Text("Chicago")
                Text("loaosdsadahsdhasdhsaodoasdiosiaod")
            }
            .padding(.horizontal)
            
            ScrollView {
                List {
                    
                }
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
