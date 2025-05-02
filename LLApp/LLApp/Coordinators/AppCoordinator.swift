//
//  AppCoordinator.swift
//  LLApp
//
//  Created by Matija Radinovic on 2.5.25..
//

import Foundation
import SwiftUI

enum AppRoute {
    case onboarding
    case menu
    case userProfile
}

class AppCoordinator: ObservableObject {
    @Published var currentRoute: AppRoute = UserDefaults.standard.bool(forKey: kIsLoggedIn) ? .menu : .onboarding

    func goToMenu() {
            currentRoute = .menu
        }

        func goToProfile() {
            currentRoute = .userProfile
        }

        func logout() {
            UserDefaults.standard.set(false, forKey: kIsLoggedIn)
            currentRoute = .onboarding
        }
}

struct RootView: View {
    @StateObject var coordinator = AppCoordinator()

    var body: some View {
        switch coordinator.currentRoute {
        case .onboarding:
            OnboardingView(viewModel: OnboardingViewModel(coordinatoe: coordinator))
        case .menu:
            MenuView(viewModel: MenuViewModel(coordinator: coordinator))
        case .userProfile:
            UserProfileView(viewModel: UserProfileViewModel(coordinator: coordinator))
        }
    }
}

