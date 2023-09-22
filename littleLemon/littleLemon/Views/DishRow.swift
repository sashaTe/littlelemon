//
//  DishRow.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 21.09.2023.
//

import SwiftUI

struct DishRow: View {
    var title: String
    var image: String
    var price: String
    var info: String
    var body: some View {
        VStack(spacing: 0) {
            HStack{
                VStack(spacing: 10) {
                    Text(title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(info)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .font(.caption)
                        .foregroundColor(.theme.gray)
                    Text("$\(price)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                }
                .padding(.leading)

                
                AsyncImage(url: URL(string: image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Rectangle())
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .padding()
                } placeholder: {
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .padding()
                }
            }
            Divider()
        }
    }
}

struct DishRow_Previews: PreviewProvider {
    static var previews: some View {
        DishRow(title:"Greek Salad", image: "", price: "12.99", info:"Our Bruschetta is made from grilled bread that has been smeared with garlic and seasoned with salt and olive oil.")
    }
}
