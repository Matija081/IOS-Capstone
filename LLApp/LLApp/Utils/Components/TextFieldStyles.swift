//
//  TextFieldStyles.swift
//  LLApp
//
//  Created by Matija Radinovic on 1.5.25..
//

import Foundation
import SwiftUI


struct PrimaryFieldStyle: TextFieldStyle {
    let title: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(Font.subheadline)
                .foregroundColor(Color.charcoalGray)
            
            
            configuration
                .frame(height: 46)
                .padding( 3)
                .background(.white)
                .cornerRadius(6)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.charcoalGray)
                }
        }
    }
}

struct SearchTextfieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal)
            .frame(height: 42)
            .background(Color.lightGray)
            .cornerRadius(6)
    }
}
