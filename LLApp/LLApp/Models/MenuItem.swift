//
//  MenuItem.swift
//  App
//
//  Created by Matija Radinovic on 30.4.25..
//

import Foundation


struct MenuItem: Decodable, Identifiable {
    var id = UUID()
    let title : String
    let descriptionDish: String
    let price: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case descriptionDish = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
