//
//  Dish+Extension.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 21.09.2023.
//

import Foundation
import CoreData


extension DishEntity {
    static func createDishesFrom(menuItems: [MenuItem], context: NSManagedObjectContext) {
        menuItems.forEach { menuItem in
            var dishArray:[DishEntity] = []
            let dish = DishEntity(context: context)
            dish.title = menuItem.title
            dish.image = menuItem.image
            dish.price = menuItem.price
            dishArray.append(dish)
        }
    }
}
