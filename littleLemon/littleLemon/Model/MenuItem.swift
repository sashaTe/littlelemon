//
//  MenuItem.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 20.09.2023.
//

import Foundation

struct MenuItem: Codable {
    var title: String
    var image: String
    var price: String
    var info: String
    var category: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case image
        case price
        case category
        case info = "description"
    }
    
}
