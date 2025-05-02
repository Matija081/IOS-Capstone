//
//  Modifiers.swift
//  LLApp
//
//  Created by Matija Radinovic on 2.5.25..
//

import Foundation
import SwiftUI

struct KeybordHideModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .contentShape(Rectangle())
            .onTapGesture {
                hideKeyboard()
            }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func keyboardDismissable() -> some View {
        self.modifier(KeybordHideModifier())
    }
}
