//
//  Let_Me_KnowApp.swift
//  Let Me Know
//
//  Created by Felipe Galindo on 11/29/20.
//

import SwiftUI

@main
struct Let_Me_KnowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
