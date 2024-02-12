//
//  CS193pApp.swift
//  CS193p
//
//  Created by Kumaresh on 11/02/24.
//

import SwiftUI
import SwiftData

@main
struct CS193pApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SwiftUIView()
        }
        .modelContainer(sharedModelContainer)
    }
}
