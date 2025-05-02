//
//  UserProfileViewModel.swift
//  LLApp
//
//  Created by Matija Radinovic on 1.5.25..
//

import Foundation

final class UserProfileViewModel: ObservableObject {
    let coordinator: AppCoordinator
    @Published var firstName = UserDefaults().string(forKey: "userFirstNameKey") ?? ""
    @Published var lastName = UserDefaults().string(forKey: "lastFirstNameKey") ?? ""
    @Published var email = UserDefaults().string(forKey: "userEmailKey") ?? ""
    @Published var image = "profileImage"
    @Published var refresh = false
    @Published var orderNotificationsEnabled = false
    @Published var passwordChangesNotificationsEnabled = false
    @Published var specialOffersNotificationsEnabled = false
    @Published var newsLetterNotificationsEnabled = false
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func toggleNotification(_ type: NotificationType) {
            switch type {
            case .order:
                orderNotificationsEnabled.toggle()
            case .passwordChange:
                passwordChangesNotificationsEnabled.toggle()
            case .specialOffer:
                specialOffersNotificationsEnabled.toggle()
            case .newsletter:
                newsLetterNotificationsEnabled.toggle()
            }
        }
    
    func changeImage() {
       
    }
    
    func removeImage() {
        
    }
    
    func discardChanges() {
         firstName = UserDefaults().string(forKey: "userFirstNameKey") ?? ""
         lastName = UserDefaults().string(forKey: "lastFirstNameKey") ?? ""
         email = UserDefaults().string(forKey: "userEmailKey") ?? ""
            refresh.toggle()
    }
    
    func saveChanges() {
        UserDefaults.standard.set(firstName, forKey: "userFirstNameKey")
        UserDefaults.standard.set(lastName, forKey: "lastFirstNameKey")
        UserDefaults.standard.set(email, forKey: "userEmailKey")
            refresh.toggle()
    }
    
    func logOut() {
        coordinator.logout()
    }
    
    func backToMenu() {
        coordinator.goToMenu()
    }
}
