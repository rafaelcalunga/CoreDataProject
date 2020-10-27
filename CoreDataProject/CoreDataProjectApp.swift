//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Rafael Calunga on 2020-10-27.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
