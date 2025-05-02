//
//  LLAppApp.swift
//  LLApp
//
//  Created by Matija Radinovic on 30.4.25..
//
import Foundation
import SwiftUI

@main
struct LLAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
