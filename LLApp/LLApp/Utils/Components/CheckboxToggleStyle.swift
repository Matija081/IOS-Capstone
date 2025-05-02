//
//  CheckboxToggleStyle.swift
//  LLApp
//
//  Created by Matija Radinovic on 2.5.25..
//
import Foundation
import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? Color.primaryGreen : Color.accentYellow)
                    .font(.system(size: 20))
                configuration.label
                    .foregroundColor(configuration.isOn ? Color.accentYellow : Color.primaryGreen)
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
