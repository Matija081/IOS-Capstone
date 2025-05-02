//
//  OnboardingViewModel.swift
//  LLApp
//
//  Created by Matija Radinovic on 1.5.25..
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var isLoggedIn = false
    @Published var onboardingPage: OnboadingPages = .firstName
    let coordinatoe: AppCoordinator
    
    init(coordinatoe: AppCoordinator) {
        self.coordinatoe = coordinatoe
    }
    enum OnboadingPages {
        case firstName
        case lastName
        case email
        
        var title: String {
            switch self {
            case .firstName:
                return "Please fill First Name"
            case .lastName:
                return "Please fill Last Name"
            case .email:
                return "Register"
            }
        }
        
        var buttonLabel: String {
            switch self {
            case .firstName:
                return "Next"
            case .lastName:
                return "Next"
            case .email:
                return "Register"
            }
        }
    }

    func switchState() {
        switch onboardingPage {
        case .firstName where isFirstNameValid:
            onboardingPage = .lastName
        case .lastName where isLastNameValid:
            onboardingPage = .email
        case .email where isEmailValid:
            register()
        default:
            break
        }
    }

    func backAction() {
        switch onboardingPage {
        case .lastName:
            onboardingPage = .firstName
        case .email:
            onboardingPage = .lastName
        default:
            break
        }
    }

    var isFirstNameValid: Bool {
        !firstName.isEmpty
    }

    var isLastNameValid: Bool {
        !lastName.isEmpty
    }

    var isEmailValid: Bool {
        !email.isEmpty
    }

    var isValidFields: Bool {
        isFirstNameValid && isLastNameValid && isEmailValid
    }

    func register() {
        guard isValidFields else { return }

        // Save the user's information
        UserDefaults.standard.set(firstName, forKey: firstNameKey)
        UserDefaults.standard.set(lastName, forKey: lastNameKey)
        UserDefaults.standard.set(email, forKey: emailKey)
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)

        coordinatoe.goToMenu()
    }


    func checkLoginStatus() {
        isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
    }
}
