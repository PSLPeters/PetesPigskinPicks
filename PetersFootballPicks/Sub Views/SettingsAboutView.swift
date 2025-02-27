//
//  SettingsAboutView.swift
//  PigskinPicks
//
//  Created by Michael Peters on 2/11/25.
//

import SwiftUI

struct SettingsAboutView: View {
    
    // MARK: AppStorage variables
    @AppStorage("selectedColorScheme") private var selectedColorScheme = ""
    
    // MARK: @State variables
    @State private var isShowingTermsofServiceSafariView = false
    @State private var isShowingPrivacyPolicySafariView = false
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            List {
                Section("App Information") {
                    LabeledContent("Version") {
                        Text(Constants.appVersionBuildString)
                    }
                }
                Section("Help") {
                    NavigationLink {
                        AboutReleaseNotesView()
                    } label: {
                        Label("Release Notes", systemImage: "book")
                    }
                    Link(destination: URL(string: "mailto:\(SettingsConstants.settingsAboutHelpContactEmailAddress)?subject=\(SettingsConstants.settingsAboutHelpContactSubjectLine)&body=\(SettingsConstants.settingsAboutHelpContactBody)")!) {
                        Label("Contact", systemImage: "envelope")
                    }
                    Button {
                        isShowingPrivacyPolicySafariView = true
                    } label: {
                        Label("Privacy Policy", systemImage: "safari")
                    }
                    .fullScreenCover(isPresented: $isShowingPrivacyPolicySafariView) {
                        SafariWebView(url: URL(string: SettingsConstants.settingsAboutHelpPrivacyPolicyURL)!)
                            .ignoresSafeArea()
                    }
                }
                .tint(.secondary)
                Section("Acknowledgments") {
                    LabeledContent("Developed By") {
                        HStack {
                            Text("Michael Peters")
                            Divider()
                            Link("GitHub", destination: URL(string: SettingsConstants.settingsAboutAcknowledgementsDeveloperGitHubURL)!)
                                .buttonStyle(.borderless)
                        }
                    }
                }
            }
        }
        .navigationTitle("About")
        .preferredColorScheme(selectedColorScheme == "System" ? nil : selectedColorScheme == "Dark" ? .dark : .light)
        .interactiveDismissDisabled(true)
    }
}

// MARK: Preview
#Preview {
    SettingsAboutView()
}

