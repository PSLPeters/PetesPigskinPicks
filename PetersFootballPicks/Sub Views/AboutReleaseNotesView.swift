//
//  AboutReleaseNotesView.swift
//  PigskinPicks
//
//  Created by Michael Peters on 2/14/25.
//

import SwiftUI

struct AboutReleaseNotesView: View {
    
    // MARK: AppStorage variables
    @AppStorage("selectedColorScheme") private var selectedColorScheme = ""
    
    // MARK: Body
    var body: some View {
        ReleaseNotesView()
        .navigationTitle("Release Notes")
        .preferredColorScheme(selectedColorScheme == "System" ? nil : selectedColorScheme == "Dark" ? .dark : .light)
    }
}

// MARK: Preview
#Preview {
    AboutReleaseNotesView()
}
