//
//  ReleaseNotesView.swift
//  PigskinPicks
//
//  Created by Michael Peters on 2/14/25.
//

import SwiftUI

struct ReleaseNotesView: View {
    
    // MARK: AppStorage variables
    @AppStorage("selectedColorScheme") private var selectedColorScheme = ""
    
    // MARK: ABody
    var body: some View {
        ScrollView {
            Text(
            """
            **Build 1.0**:
            - \(Image(systemName: "american.football")) Initial release of Pigskin Picks!
            """)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .padding()
        .preferredColorScheme(selectedColorScheme == "System" ? nil : selectedColorScheme == "Dark" ? .dark : .light)
    }
}

// MARK: Preview
#Preview {
    ReleaseNotesView()
}
