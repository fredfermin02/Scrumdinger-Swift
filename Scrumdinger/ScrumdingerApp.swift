//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Frederick Fermin on 4/11/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
