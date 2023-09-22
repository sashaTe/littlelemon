//
//  DetailView.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 22.09.2023.
//

import SwiftUI

struct DetailView: View {
    var image: String
    var title: String
    var info : String
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image)) { image in
                image
                    
                    .resizable()
                    .frame(height: 320)
                    .scaledToFit()
                    
            } placeholder: {
                Rectangle()
                    .frame(height: 320)
            }
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            Text(info)
                .font(.headline)
                .foregroundColor(.theme.special)
                .padding()
Spacer()
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "", title: "Greek salad", info: "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.")
    }
}
