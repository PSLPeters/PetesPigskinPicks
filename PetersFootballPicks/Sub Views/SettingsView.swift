//
//  SettingsView.swift
//  PigskinPicks
//
//  Created by Michael Peters on 2/11/25.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: AppStorage variables
    @AppStorage("isExpandedLeagueInfo") private var isExpandedLeagueInfo = true
    @AppStorage("isExpandedAppearance") private var isExpandedAppearance = true
    @AppStorage("isExpandedGeneral") private var isExpandedGeneral = true
    
    @AppStorage("leagueInfoLeagueName") var leagueInfoLeagueName: String = ""
    @AppStorage("leagueInfoLeagueBuyIn") var leagueInfoLeagueBuyIn: Double = 0
    @AppStorage("leagueInfoLeagueAdjustment") var leagueInfoLeagueAdjustment: Double = 0
    @AppStorage("leagueInfoLeaguePlayerCount") var leagueInfoLeaguePlayerCount = 0.0
    
    @AppStorage("selectedColorScheme") var selectedColorScheme = ""
    @AppStorage("selectedAppTintIndex") var selectedAppTintIndex = 0
    @AppStorage("selectedTitleItem") var selectedTitleItem = "None"
    
    @AppStorage("doDateInsteadOfString") var doDateInsteadOfString = false
    @AppStorage("doHaptics") private var doHaptics = true
    
    // MARK: @State variables
    @State private var leagueinfoLeaguePotValue: Double = 0
    
    // MARK: Other variables
    @Binding var isShowingSettingsSheet: Bool
    
    // MARK: Body
    var body: some View {
        
        // MARK: Calculated variables
        var hapticsIntensity: Double {
            doHaptics ? 1.0 : 0.0
        }
        
        var allSectionsExpanded: Bool {
            isExpandedLeagueInfo &&
            isExpandedAppearance &&
            isExpandedGeneral
        }
        
        var allSectionsCollapsed: Bool {
            !isExpandedLeagueInfo &&
            !isExpandedAppearance &&
            !isExpandedGeneral
        }
        
        NavigationStack {
            List{
                Section("League", isExpanded: $isExpandedLeagueInfo) {
                    NavigationLink {
                        LeagueInfoView(
                            leagueInfoLeagueName: $leagueInfoLeagueName,
                            leagueInfoLeagueBuyIn: $leagueInfoLeagueBuyIn,
                            leagueInfoLeaguePlayerCount: $leagueInfoLeaguePlayerCount,
                            leagueInfoLeagueAdjustment: $leagueInfoLeagueAdjustment,
                            leagueinfoLeaguePotValue: $leagueinfoLeaguePotValue,
                            isShowingSettingsSheet: $isShowingSettingsSheet
                        )
                            .navigationTitle("League Information")
                    } label: {
                        Text("League Information")
                    }
                }
                .sensoryFeedback(.impact(flexibility: .soft, intensity: hapticsIntensity), trigger: isExpandedLeagueInfo)
                Section("Appearance", isExpanded: $isExpandedAppearance) {
                    Picker("Color Scheme", selection: $selectedColorScheme) {
                        ForEach(arrColorSchemes.indices, id:\.self) { index in
                            let activeColorScheme = arrColorSchemes[index]
                                HStack {
                                    Text(activeColorScheme.image)
                                        .foregroundStyle(arrAppTints[selectedAppTintIndex].color)
                                    Text(activeColorScheme.name)
                                }
                                .tag(activeColorScheme.name)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    NavigationLink {
                        SettingsAccentsView()
                        .navigationTitle("Accent Color")
                    } label: {
                        HStack {
                            Text("Accent Color")
                            Spacer()
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: 30, height: 15)
                                .padding(.trailing)
                                .foregroundStyle(arrAppTints[selectedAppTintIndex].color)
                        }
                    }
                    Picker("Include in Title", selection: $selectedTitleItem) {
                        ForEach(arrTitleItems.indices, id:\.self) { index in
                            let activeTitleItem = arrTitleItems[index]
                            Text(activeTitleItem.name)
                                .tag(activeTitleItem.name)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    Toggle("Use Dates", isOn: $doDateInsteadOfString)
                }
                .sensoryFeedback(.impact(flexibility: .soft, intensity: hapticsIntensity), trigger: isExpandedAppearance)
                Section("General", isExpanded: $isExpandedGeneral) {
                    NavigationLink("About") {
                        SettingsAboutView()
                    }
                    if (UIDevice.current.userInterfaceIdiom != .pad)
                    {
                        Toggle("Haptic Feedback", isOn: $doHaptics)
                    }
                }
                .sensoryFeedback(.impact(flexibility: .soft, intensity: hapticsIntensity), trigger: isExpandedGeneral)
            }
            .listStyle(.sidebar)
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Close")
                    {
                        isShowingSettingsSheet = false
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Menu {
                        Section("View Options") {
                            Button {
                                isExpandedLeagueInfo = true
                                isExpandedAppearance = true
                                isExpandedGeneral = true
                            } label: {
                                Text("Expand All")
                                Image(systemName: "chevron.down")
                            }
                            .disabled(allSectionsExpanded)
                            
                            Button {
                                isExpandedLeagueInfo = false
                                isExpandedAppearance = false
                                isExpandedGeneral = false
                            } label: {
                                Text("Collapse All")
                                Image(systemName: "chevron.up")
                            }
                            .disabled(allSectionsCollapsed)
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(arrAppTints[selectedAppTintIndex].color)
        .preferredColorScheme(selectedColorScheme == "System" ? nil : selectedColorScheme == "Dark" ? .dark : .light)
        .interactiveDismissDisabled(true)
    }
}

// MARK: Preview
#Preview {
    @Previewable @State var isShowingSettingsSheet: Bool = false
    
    SettingsView(isShowingSettingsSheet: $isShowingSettingsSheet)
}
