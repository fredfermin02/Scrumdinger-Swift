//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Frederick Fermin on 4/13/25.
//

import SwiftUI

struct NewScrumSheet: View {
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: nil)
        }
    }
}

#Preview {
    NewScrumSheet()
}
