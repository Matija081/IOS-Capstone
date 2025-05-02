//
//  Onboarding.swift
//  App
//
//  Created by Matija Radinovic on 28.4.25..
//

import SwiftUI

let firstNameKey = "userFirstNameKey"
let lastNameKey = "lastFirstNameKey"
let emailKey = "userEmailKey"
let kIsLoggedIn = "kIsLoggedIn"

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    let persistence = PersistenceController.shared
    
    var body: some View {
        presentationView
    }
    
    var presentationView: some View {
        VStack {
            Image("logo")
            
            heroView
            
            Text(viewModel.onboardingPage.title)
                .foregroundColor(Color.primaryGreen)
                .font(Font.title)
                .padding(.bottom, 60)
            
            Group {
                switch viewModel.onboardingPage {
                case .firstName:
                    TextField("First name", text: $viewModel.firstName)
                        .textFieldStyle(PrimaryFieldStyle(title: "Firstname*"))
                case .lastName:
                    TextField("Last name", text: $viewModel.lastName)
                        .textFieldStyle(PrimaryFieldStyle(title: "Lastname*"))
                case .email:
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(PrimaryFieldStyle(title: "Email*"))
                        .keyboardType(.emailAddress)
                }
            }
            
            
            
            
            Spacer()
            
            buttonsView
        }
        .keyboardDismissable()
        .navigationBarBackButtonHidden()
        .padding(.horizontal)
        .onAppear {
            if UserDefaults().bool(forKey: kIsLoggedIn) {
                viewModel.checkLoginStatus()
            }
        }
    }
    
    var buttonsView: some View {
        HStack {
            if viewModel.onboardingPage != .firstName {
                Button("Back") {
                    viewModel.backAction()
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            
            Button(viewModel.onboardingPage.buttonLabel) {
                viewModel.switchState()
                
            }
            .buttonStyle(PrimaryButtonStyle())
        }
    }
    
    var heroView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Little Lemon")
                .font( Font.displayTitle)
                .foregroundColor(Color.accentYellow)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Chicago")
                        .font(Font.displaySubTitle)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10)
                    
                    Text("We are family owned mediterrean restaurant, focused on traditional recipes served with a modern twist.")
                        .padding(.trailing, 20)
                        .font(Font.leadText)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom, 12)
                
                Image("Heroimage")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(10)
        .background(Color.primaryGreen)
    }
}
