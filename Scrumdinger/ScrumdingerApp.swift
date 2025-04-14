//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Frederick Fermin on 4/11/25.
//

import SwiftUI
import SwiftData

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
    .modelContainer(for: DailyScrum.self)
//        .modelContainer(try! .init(for: DailyScrum.self, configurations: .init(allowsSave: false)))
    }
}
