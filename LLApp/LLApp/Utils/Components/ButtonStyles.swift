//
//  ButtonStyles.swift
//  LLApp
//
//  Created by Matija Radinovic on 1.5.25..
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 46)
            .foregroundColor(Color.primaryGreen)
            .background(configuration.isPressed ? Color.white : Color.accentYellow)
            .cornerRadius(8)
    }
}

struct GreenButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 16)
            .frame(height: 34)
            .foregroundColor(configuration.isPressed ? Color.accentYellow : Color.white)
            .background(configuration.isPressed ? Color.white : Color.primaryGreen)
            .cornerRadius(8)
    }
}

struct whiteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 16)
            .frame(height: 34)
            .foregroundColor(configuration.isPressed ? Color.white : Color.primaryGreen)
            .background(configuration.isPressed ? Color.primaryGreen : Color.white)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryGreen)
            }
    }
}
