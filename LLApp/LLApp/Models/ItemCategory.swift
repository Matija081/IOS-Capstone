//
//  ItemCategory.swift
//  LLApp
//
//  Created by Matija Radinovic on 2.5.25..
//


enum ItemCategory: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case starters = "Starters"
    case mains = "Mains"
    case desserts = "Desserts"
    case drinks = "Drinks"
}
