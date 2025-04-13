//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Frederick Fermin on 4/11/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
