//
//  NotificationType.swift
//  LLApp
//
//  Created by Matija Radinovic on 2.5.25..
//


enum NotificationType: CaseIterable, Identifiable {
    var id: Self { self }
    
    case order
    case passwordChange
    case specialOffer
    case newsletter

    var label: String {
        switch self {
        case .order: return "Order statuses"
        case .passwordChange: return "Password changes"
        case .specialOffer: return "Special offers"
        case .newsletter: return "Newsletter"
        }
    }
}
