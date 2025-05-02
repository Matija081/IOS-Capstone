//
//  MenuItemView.swift
//  LLApp
//
//  Created by Matija Radinovic on 30.4.25..
//

import SwiftUI

struct MenuItemView: View {
    let menuItem: MenuItem
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: menuItem.image))
                .frame(height: 300)
            
            Text(menuItem.title)
                .font(.largeTitle)
            
            Text(menuItem.title)
                .font(.subheadline)
            Spacer()
        }
        .ignoresSafeArea()
    }
}

