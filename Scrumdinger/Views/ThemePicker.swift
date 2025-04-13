//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Frederick Fermin on 4/12/25.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    @State var theme = Theme.periwinkle
    return(
    ThemePicker(selection: $theme))
}
