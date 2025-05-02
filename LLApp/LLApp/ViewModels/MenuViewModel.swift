//
//  MenuViewModel.swift
//  LLApp
//
//  Created by Matija Radinovic on 2.5.25..
//

import Foundation
import CoreData
import SwiftUI



class MenuViewModel: ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext
    let coordinator: AppCoordinator
    @Published var searchText = ""
    @Published var selectedCategory: ItemCategory = .starters
    @Published var isFetched = false
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func setCategory(category: ItemCategory) {
        selectedCategory = category
    }

    var predicate: NSPredicate {
        guard !searchText.isEmpty else { return NSPredicate(value: true) }
        
        let searchPredicate = NSPredicate(format: "title contains[cd] %@", searchText)
        
        let categoryPreducate = NSPredicate(format: "category != %@", selectedCategory.rawValue)
        
        let compoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [searchPredicate, categoryPreducate])
        
        return compoundPredicate
    }

    var sortDescriptors: [NSSortDescriptor] {
        [NSSortDescriptor(
            key: "title",
            ascending: true,
            selector: #selector(NSString.localizedCaseInsensitiveCompare)
        )]
    }

    func getMenuData() {
        PersistenceController.shared.clear()

        guard let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json") else { return }

        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error)")
                return
            }

            guard let data = data else { return }

            let decoder = JSONDecoder()
            if let menuObject = try? decoder.decode(MenuList.self, from: data) {
                DispatchQueue.main.async {
                    for item in menuObject.menu {
                        let dish = Dish(context: self.viewContext)
                        dish.title = item.title
                        dish.image = item.image
                        dish.price = item.price
                        dish.dishDescription = item.descriptionDish
                        dish.category = item.category
                    }

                    try? self.viewContext.save()
                }
            }
        }

        isFetched = true
        
        task.resume()
    }
    
    func navigateToProfile() {
        coordinator.goToProfile()
    }
}
