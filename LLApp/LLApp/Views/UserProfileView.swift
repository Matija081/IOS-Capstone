//
//  UserProfile.swift
//  App
//
//  Created by Matija Radinovic on 29.4.25..
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var viewModel: UserProfileViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        presentationView
    }
    
    var presentationView: some View {
        VStack(alignment: .leading) {
            header
                Text("Personal information")
                .font(Font.sectionTitle)
                
            avatarView
            
            fields
            
            Text("Email notifications")
            .font(Font.sectionTitle)
            
            notificationsCenter
                
                Spacer()
                
            bottomButtonsView
        }
        .keyboardDismissable()
        .padding(.horizontal)
        .padding(.bottom, 40)
        .id(viewModel.refresh)
    }
    
    
    var header: some View {
        HStack {
            Button(action: { viewModel.backToMenu() }) {
                Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Circle().fill(Color.primaryGreen))
            }
            
            Spacer()
            
            Image("logo")
            
            Spacer()
            
            Image("profileImage")
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
    
    var avatarView: some View {
        VStack(alignment: .leading) {
            Text("Avatar")
                .font(Font.subheadline)
                .foregroundColor(Color.charcoalGray)
            
            HStack {
                Image("profileImage")
                    .resizable()
                    .frame(width: 68, height: 68)
                
                HStack {
                    Button("Change") {
                        viewModel.changeImage()
                    }
                    .buttonStyle(GreenButtonStyle())
                    
                    Button("Remove") {
                        viewModel.removeImage()
                    }
                    .buttonStyle(whiteButtonStyle())
                }
            }
        }
    }
    
    var fields: some View {
        VStack {
            TextField("", text: $viewModel.firstName)
                .textFieldStyle(PrimaryFieldStyle(title: "First Name"))
            
            TextField("", text: $viewModel.lastName)
                .textFieldStyle(PrimaryFieldStyle(title: "Last Name"))
            
            TextField("", text: $viewModel.email)
                .textFieldStyle(PrimaryFieldStyle(title: "Email"))
                .keyboardType(.emailAddress)
        }
    }
    
    var bottomButtonsView: some View {
        VStack {
            Button("Logout") {
                viewModel.logOut()
            }
            .buttonStyle(PrimaryButtonStyle())
            
            HStack {
                Button("Discard Changes") {
                    viewModel.discardChanges()
                }
                .buttonStyle(whiteButtonStyle())
                
                Button("Save changes") {
                    viewModel.saveChanges()
                }
                    .buttonStyle(GreenButtonStyle())
            }
            .padding(.horizontal, 20)
        }
    }
    
    var notificationsCenter: some View {
        VStack(alignment: .leading) {
            notificationView(.order, isEnabled: $viewModel.orderNotificationsEnabled)
            notificationView(.passwordChange, isEnabled: $viewModel.passwordChangesNotificationsEnabled)
            notificationView(.specialOffer, isEnabled: $viewModel.specialOffersNotificationsEnabled)
            notificationView(.newsletter, isEnabled: $viewModel.newsLetterNotificationsEnabled)
        }
    }
    
    @ViewBuilder
    func notificationView(_ notificationType: NotificationType, isEnabled: Binding<Bool>) -> some View {
        Toggle(notificationType.label, isOn: isEnabled)
            .toggleStyle(CheckboxToggleStyle())
    }
}
