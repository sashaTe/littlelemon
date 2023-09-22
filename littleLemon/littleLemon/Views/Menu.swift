//
//  Menu.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 05.09.2023.
//

import SwiftUI

struct Menu: View {

   
    let persistence = PersistenceController.shared
    @Environment(\.managedObjectContext) var context
    @State private var searchText: String = ""
    @State private var justStarters = false
    @State private var justMains = false
    @State private var justDesserts = false
    @State private var justDrinks = false
    
    @FetchRequest<DishEntity>(sortDescriptors: [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))])private var dishes: FetchedResults<DishEntity>
    
    @State private var isActive = false
    
    
  
    
    var body: some View {

        NavigationView {
            VStack(spacing: 0) {
    //        MARK: NAVIGATION BAR
                HStack {
                    Spacer()
                    Spacer()
                    Image("Logo")
                    Spacer()
                    NavigationLink {
                        UserProfile()
                    } label: {
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .padding(.trailing)
                    }
                }
    //        MARK: HERO SECTION
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.theme.accent)
                        .frame(height: 320)
                        VStack(alignment: .leading) {
                            Text("Little Lemon")
                                .font(Font.custom("Georgia", size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.theme.yellow)
                                .padding(.top)
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
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 30)
                                   
                                    .padding(.trailing)
                                    .foregroundColor(.theme.white)
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .padding(.leading, 5)
                                    TextField("", text: $searchText)
                                        .onChange(of: searchText) { text in
                                            dishes.nsPredicate = text.isEmpty ? nil : NSPredicate(format: "title CONTAINS %@", text)
                                        }
                                    
                                }
                            }
                            .padding(.bottom)
                            
                            
                        }
                        .padding(.leading)

                          
                    
                   
                }
                VStack() {
                    Text("ORDER FOR DELIVERY")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                        .padding(.leading, 25)
                    HStack {
                        Button {
                            justStarters.toggle()
                            justMains = false
                            justDesserts = false
                            justDrinks = false
                            dishes.nsPredicate = justStarters ? NSPredicate(format: "category = 'starters'") : nil
                        } label: {
                          Text("Starters")
                                .foregroundColor(justStarters ? .theme.yellow : .theme.accent)
                        }
                        .buttonStyle(.bordered).opacity(justStarters ? 1.0 : 0.7)
                        Button {
                            justStarters = false
                            justMains.toggle()
                            justDesserts = false
                            justDrinks = false
                            dishes.nsPredicate = justMains ? NSPredicate(format: "category = 'mains'") : nil
                        } label: {
                          Text("Mains")
                                .foregroundColor(justMains ? .theme.yellow : .theme.accent)
                        }
                        .buttonStyle(.bordered).opacity(justMains ? 1.0 : 0.7)
                        Button {
                            justStarters = false
                            justMains = false
                            justDesserts.toggle()
                            justDrinks = false
                            dishes.nsPredicate = justDesserts ? NSPredicate(format: "category = 'desserts'") : nil
                        } label: {
                          Text("Desserts")
                                .foregroundColor(justDesserts ? .theme.yellow : .theme.accent)
                        }
                        .buttonStyle(.bordered).opacity(justDesserts ? 1.0 : 0.7)
                        Button {
                            justStarters = false
                            justMains = false
                            justDesserts = false
                            justDrinks.toggle()
                            dishes.nsPredicate = justDrinks ? NSPredicate(format: "category = 'drinks'") : nil
                        } label: {
                          Text("Drinks")
                                .foregroundColor(justDrinks ? .theme.yellow : .theme.accent)
                        }
                        .buttonStyle(.bordered).opacity(justDrinks ? 1.0 : 0.7)
                    }
                    .buttonStyle(.bordered)
                    .font(.headline)
                    .padding(.bottom, 10)
                    Divider()
                    
                    ScrollView {
                        ForEach(dishes) { dish in
                            NavigationLink {
                                DetailView(image: dish.image ?? "", title: dish.title ?? "", info: dish.info ?? "")
                            } label: {
                                DishRow(title: dish.title ?? "", image: dish.image ?? "", price: dish.price ?? "", info: dish.info ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }

                            
                        }
                    }
                }
                Spacer()
            }
            
        }
        .task {
            try? await getMenuData()
        }
        
    }
    
    func getMenuData() async throws {
//        print("getMenu called")
        deleteDishes()
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        guard let url = URL(string: urlString) else {print("bad url")
            return
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {print("bad response")
            throw LLError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let menuList = try decoder.decode(MenuList.self, from: data)
            for menuItem in menuList.menu {
                let dish = DishEntity(context: context)
                dish.title = menuItem.title
//                print(menuItem.info)
                dish.price = menuItem.price
                dish.image = menuItem.image
                dish.info = menuItem.info
                dish.category = menuItem.category
                try context.save()
            }
            
        }
        
        catch { }
    }
    
  
    func deleteDishes() {
        for dish in dishes {
            context.delete(dish)
        }
        try? context.save()
    }
    
}
    


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
