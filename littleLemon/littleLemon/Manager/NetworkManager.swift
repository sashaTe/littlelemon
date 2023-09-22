//
//  NetworkManager.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 21.09.2023.
//

import Foundation
import SwiftUI


class NetworkManager {
    static let shared = NetworkManager()
    private let baseURl = ""
    @Environment(\.managedObjectContext) private var viewContext
    private init() {}
    
    func getMenuData() async throws {
//        PersistenceController.shared.clear()
        
        let endpoint = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        guard let url = URL(string: endpoint) else {throw LLError.invalidURl}
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {throw LLError.invalidResponse}
            
            do {
                let decoder = JSONDecoder()
                let menuList = try decoder.decode(MenuList.self, from: data)
               
//                for item in menuList.menu {
//                    let dish = DishEntity(context: viewContext)
//                    dish.image = item.image
//                    dish.price = item.price
//                    dish.title = item.title
//                   try viewContext.save()
//                }
            } catch {
                throw LLError.invalidData
            }
        }
}
