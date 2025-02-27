//
//  ContentView.swift
//  PigskinPicks
//
//  Created by Michael Peters on 1/17/25.
//

import SwiftUI

struct PigskinPicksMainView: View {
    
    // MARK: AppStorage variables
    @AppStorage("selectedColorScheme") var selectedColorScheme = ""
    @AppStorage("selectedAppTintIndex") var selectedAppTintIndex = 0
    @AppStorage("selectedTitleItem") var selectedTitleItem = "None"
    @AppStorage("doDateInsteadOfString") var doDateInsteadOfString = false
    @AppStorage("doHaptics") private var doHaptics = true
    
    @AppStorage("selectedTeamName1") var selectedTeamName1: String = ""
    @AppStorage("selectedTeamName2") var selectedTeamName2: String = ""
    @AppStorage("selectedTeamName3") var selectedTeamName3: String = ""
    @AppStorage("selectedTeamName4") var selectedTeamName4: String = ""
    @AppStorage("selectedTeamName5") var selectedTeamName5: String = ""
    @AppStorage("selectedTeamName6") var selectedTeamName6: String = ""
    @AppStorage("selectedTeamName7") var selectedTeamName7: String = ""
    @AppStorage("selectedTeamName8") var selectedTeamName8: String = ""
    @AppStorage("selectedTeamName9") var selectedTeamName9: String = ""
    @AppStorage("selectedTeamName10") var selectedTeamName10: String = ""
    @AppStorage("selectedTeamName11") var selectedTeamName11: String = ""
    @AppStorage("selectedTeamName12") var selectedTeamName12: String = ""
    @AppStorage("selectedTeamName13") var selectedTeamName13: String = ""
    @AppStorage("selectedTeamName14") var selectedTeamName14: String = ""
    @AppStorage("selectedTeamName15") var selectedTeamName15: String = ""
    @AppStorage("selectedTeamName16") var selectedTeamName16: String = ""
    @AppStorage("selectedTeamName17") var selectedTeamName17: String = ""
    
    @AppStorage("selectedTeamsSortStateIndex") var selectedTeamsSortStateIndex = 0
    @AppStorage("remainingTeamsSortStateIndex") var remainingTeamsSortStateIndex = 0
    
    @AppStorage("leagueInfoLeagueName") var leagueInfoLeagueName: String = ""
    @AppStorage("leagueInfoLeagueBuyIn") var leagueInfoLeagueBuyIn: Double = 0
    @AppStorage("leagueInfoLeagueAdjustment") var leagueInfoLeagueAdjustment: Double = 0
    @AppStorage("leagueInfoLeaguePlayerCount") var leagueInfoLeaguePlayerCount = 0.0
    
    // MARK: @State variables
    @State private var defaultTeamName = "The Defaults"
    
    @State private var isShowingSelectedTeamsSheet = false
    @State private var isShowingSettingsSheet = false
    @State private var isShowingClearAllAlert = false
    
    @State private var arrSelectedTeamsListSorted = [] as [String]
    
    // MARK: Haptic toggles
    @State private var clearTeamsHapticToggle = false
    @State private var copyToClipboardHapticToggle = false
    
    // MARK: Body
    var body: some View {
        
        // MARK: Calculated variables
        var hapticsIntensity: Double {
            doHaptics ? 1.0 : 0.0
        }
        
        let arrFootballTeams2 = arrFootballTeams.filter { !$0.name.contains(selectedTeamName1) }
        let arrFootballTeams3 = arrFootballTeams2.filter { !$0.name.contains(selectedTeamName2) }
        let arrFootballTeams4 = arrFootballTeams3.filter { !$0.name.contains(selectedTeamName3) }
        let arrFootballTeams5 = arrFootballTeams4.filter { !$0.name.contains(selectedTeamName4) }
        let arrFootballTeams6 = arrFootballTeams5.filter { !$0.name.contains(selectedTeamName5) }
        let arrFootballTeams7 = arrFootballTeams6.filter { !$0.name.contains(selectedTeamName6) }
        let arrFootballTeams8 = arrFootballTeams7.filter { !$0.name.contains(selectedTeamName7) }
        let arrFootballTeams9 = arrFootballTeams8.filter { !$0.name.contains(selectedTeamName8) }
        let arrFootballTeams10 = arrFootballTeams9.filter { !$0.name.contains(selectedTeamName9) }
        let arrFootballTeams11 = arrFootballTeams10.filter { !$0.name.contains(selectedTeamName10) }
        let arrFootballTeams12 = arrFootballTeams11.filter { !$0.name.contains(selectedTeamName11) }
        let arrFootballTeams13 = arrFootballTeams12.filter { !$0.name.contains(selectedTeamName12) }
        let arrFootballTeams14 = arrFootballTeams13.filter { !$0.name.contains(selectedTeamName13) }
        let arrFootballTeams15 = arrFootballTeams14.filter { !$0.name.contains(selectedTeamName14) }
        let arrFootballTeams16 = arrFootballTeams15.filter { !$0.name.contains(selectedTeamName15) }
        let arrFootballTeams17 = arrFootballTeams16.filter { !$0.name.contains(selectedTeamName16) }
        
        let arrRemainingTeamsList = arrFootballTeams17.filter { !$0.name.contains(selectedTeamName17) && !$0.name.isEmpty }
        
        let arrSelectedTeamsList = [
            selectedTeamName1,
            selectedTeamName2,
            selectedTeamName3,
            selectedTeamName4,
            selectedTeamName5,
            selectedTeamName6,
            selectedTeamName7,
            selectedTeamName8,
            selectedTeamName9,
            selectedTeamName10,
            selectedTeamName11,
            selectedTeamName12,
            selectedTeamName13,
            selectedTeamName14,
            selectedTeamName15,
            selectedTeamName16,
            selectedTeamName17
        ].filter { !$0.isEmpty }
        
        let selectedTeamCount = arrSelectedTeamsList.count
        let remainingTeamCount = arrRemainingTeamsList.filter { !$0.name.isEmpty }.count
        
        let leagueNameText = !leagueInfoLeagueName.isEmpty ? leagueInfoLeagueName : "Pigskin Picks"
        let leagueInfoCalculatedPot = (leagueInfoLeagueBuyIn * Double(leagueInfoLeaguePlayerCount)) - leagueInfoLeagueAdjustment
        let leagueInfoLeagueBuyInFormatted = String(leagueInfoLeagueBuyIn.formatted(.currency(code: "USD")))
        let leagueInfoLeagueCalculatedPotFormatted = String(leagueInfoCalculatedPot.formatted(.currency(code: "USD")))
        
        let leagueTitleItem =
        selectedTitleItem == "None" ? ""
        : selectedTitleItem == "Buy In" ? "(\(leagueInfoLeagueBuyInFormatted))"
        : "(\(leagueInfoLeagueCalculatedPotFormatted))"
        
        let titleText = leagueNameText + " " + leagueTitleItem
        
        NavigationStack {
            List {
                Section {
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[0].dateString : arrWeekDisplays[0].textString,
                        selectedTeamName: $selectedTeamName1,
                        selectedTeamNamePrior: $defaultTeamName,
                        arrFootballTeams: arrFootballTeams
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[1].dateString : arrWeekDisplays[1].textString,
                        selectedTeamName: $selectedTeamName2,
                        selectedTeamNamePrior: $selectedTeamName1,
                        arrFootballTeams: arrFootballTeams2
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[2].dateString : arrWeekDisplays[2].textString,
                        selectedTeamName: $selectedTeamName3,
                        selectedTeamNamePrior: $selectedTeamName2,
                        arrFootballTeams: arrFootballTeams3
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[3].dateString : arrWeekDisplays[3].textString,
                        selectedTeamName: $selectedTeamName4,
                        selectedTeamNamePrior: $selectedTeamName3,
                        arrFootballTeams: arrFootballTeams4
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[4].dateString : arrWeekDisplays[4].textString,
                        selectedTeamName: $selectedTeamName5,
                        selectedTeamNamePrior: $selectedTeamName4,
                        arrFootballTeams: arrFootballTeams5
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[5].dateString : arrWeekDisplays[5].textString,
                        selectedTeamName: $selectedTeamName6,
                        selectedTeamNamePrior: $selectedTeamName5,
                        arrFootballTeams: arrFootballTeams6
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[6].dateString : arrWeekDisplays[6].textString,
                        selectedTeamName: $selectedTeamName7,
                        selectedTeamNamePrior: $selectedTeamName6,
                        arrFootballTeams: arrFootballTeams7
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[7].dateString : arrWeekDisplays[7].textString,
                        selectedTeamName: $selectedTeamName8,
                        selectedTeamNamePrior: $selectedTeamName7,
                        arrFootballTeams: arrFootballTeams8
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[8].dateString : arrWeekDisplays[8].textString,
                        selectedTeamName: $selectedTeamName9,
                        selectedTeamNamePrior: $selectedTeamName8,
                        arrFootballTeams: arrFootballTeams9
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[9].dateString : arrWeekDisplays[9].textString,
                        selectedTeamName: $selectedTeamName10,
                        selectedTeamNamePrior: $selectedTeamName9,
                        arrFootballTeams: arrFootballTeams10
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[10].dateString : arrWeekDisplays[10].textString,
                        selectedTeamName: $selectedTeamName11,
                        selectedTeamNamePrior: $selectedTeamName10,
                        arrFootballTeams: arrFootballTeams11
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[11].dateString : arrWeekDisplays[11].textString,
                        selectedTeamName: $selectedTeamName12,
                        selectedTeamNamePrior: $selectedTeamName11,
                        arrFootballTeams: arrFootballTeams12
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[12].dateString : arrWeekDisplays[12].textString,
                        selectedTeamName: $selectedTeamName13,
                        selectedTeamNamePrior: $selectedTeamName12,
                        arrFootballTeams: arrFootballTeams13
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[13].dateString : arrWeekDisplays[13].textString,
                        selectedTeamName: $selectedTeamName14,
                        selectedTeamNamePrior: $selectedTeamName13,
                        arrFootballTeams: arrFootballTeams14
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[14].dateString : arrWeekDisplays[14].textString,
                        selectedTeamName: $selectedTeamName15,
                        selectedTeamNamePrior: $selectedTeamName14,
                        arrFootballTeams: arrFootballTeams15
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[15].dateString : arrWeekDisplays[15].textString,
                        selectedTeamName: $selectedTeamName16,
                        selectedTeamNamePrior: $selectedTeamName15,
                        arrFootballTeams: arrFootballTeams16
                    )
                    PickerView(
                        title: doDateInsteadOfString ? arrWeekDisplays[16].dateString : arrWeekDisplays[16].textString,
                        selectedTeamName: $selectedTeamName17,
                        selectedTeamNamePrior: $selectedTeamName16,
                        arrFootballTeams: arrFootballTeams17
                    )
                } header: {
                    HStack {
                        Text(doDateInsteadOfString ? "Date" : "Week")
                        Spacer()
                        Text("Pick")
                    }
                }
            }
            .padding(.top, -15)
            .pickerStyle(.menu)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        isShowingSelectedTeamsSheet = true
                    }
                           , label: {
                        Image(systemName: "american.football")
                            .imageScale(.large)
                    })
                    .sensoryFeedback(.impact(weight: .light, intensity: hapticsIntensity), trigger: isShowingSelectedTeamsSheet)
                    .sheet(isPresented: $isShowingSelectedTeamsSheet) {
                        NavigationStack {
                            List {
                                Section {
                                    NavigationLink("Picks (\(selectedTeamCount))") {
                                        List {
                                            Section {
                                                ForEach(arrSelectedTeamsListSorted, id:\.self) { team in
                                                    Text(team)
                                                }
                                            }
                                        }
                                        .padding(.top, -15)
                                        .task(id: selectedTeamsSortStateIndex) {
                                            switch (selectedTeamsSortStateIndex) {
                                            case 0:
                                                arrSelectedTeamsListSorted = arrSelectedTeamsList.sorted()
                                            case 1:
                                                arrSelectedTeamsListSorted = arrSelectedTeamsList.sorted().reversed()
                                            case 2:
                                                arrSelectedTeamsListSorted = arrSelectedTeamsList
                                            case 3:
                                                arrSelectedTeamsListSorted = arrSelectedTeamsList.reversed()
                                            default:
                                                arrSelectedTeamsListSorted = arrSelectedTeamsList
                                            }
                                        }
                                        .toolbar {
                                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                                Menu {
                                                    Picker(selection: $selectedTeamsSortStateIndex) {
                                                        ForEach(arrSelectedTeamsSortState.indices, id:\.self) { index in
                                                            let activeSortState = arrSelectedTeamsSortState[index]
                                                            Label(activeSortState.text, systemImage: activeSortState.imageString)
                                                                .tag(index)
                                                        }
                                                    } label: {
                                                        Label("Sort", systemImage: "arrow.up.arrow.down")
                                                    }
                                                    .pickerStyle(.menu)
                                                    Button {
                                                        let clipboardText = arrSelectedTeamsListSorted.joined(separator: "\n")
                                                        UIPasteboard.general.setValue(clipboardText, forPasteboardType: "public.plain-text")
                                                        copyToClipboardHapticToggle.toggle()
                                                    } label : {
                                                        Label("Copy to Clipboard", systemImage: "document.on.document")
                                                    }
                                                    Divider()
                                                    Button(role: .destructive) {
                                                        isShowingSelectedTeamsSheet = false
                                                    } label: {
                                                        Text("Close")
                                                    }
                                                } label: {
                                                    Image(systemName: "ellipsis.circle")
                                                }
                                                .sensoryFeedback(.impact(flexibility: .soft, intensity: hapticsIntensity), trigger: selectedTeamsSortStateIndex)
                                                .sensoryFeedback(.impact(flexibility: .solid, intensity: hapticsIntensity), trigger: copyToClipboardHapticToggle)
                                            }
                                        }
                                        .navigationTitle("Picks")
                                        .navigationBarTitleDisplayMode(.inline)
                                    }
                                    .disabled(selectedTeamCount == 0)
                                    NavigationLink("Remaining Teams (\(remainingTeamCount))") {
                                        List {
                                            Section {
                                                switch (remainingTeamsSortStateIndex) {
                                                case 0:
                                                    let arrRemainingTeamsListSorted0 = arrRemainingTeamsList.sorted { $0.name < $1.name }
                                                    ForEach(arrRemainingTeamsListSorted0.indices, id:\.self) { index in
                                                        Text(arrRemainingTeamsListSorted0[index].name)
                                                    }
                                                case 1:
                                                    let arrRemainingTeamsListSorted1 = arrRemainingTeamsList.sorted { $0.name > $1.name }
                                                    ForEach(arrRemainingTeamsListSorted1.indices, id:\.self) { index in
                                                        Text(arrRemainingTeamsListSorted1[index].name)
                                                    }
                                                default:
                                                    ForEach(arrRemainingTeamsList.indices, id:\.self) { index in
                                                        Text(arrRemainingTeamsList[index].name)
                                                    }
                                                }
                                            }
                                        }
                                        .padding(.top, -15)
                                        .toolbar {
                                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                                var clipboardText = ""
                                                Menu {
                                                    Picker(selection: $remainingTeamsSortStateIndex) {
                                                        ForEach(arrRemainingTeamsSortState.indices, id:\.self) { index in
                                                            let activeSortState = arrRemainingTeamsSortState[index]
                                                            Label(activeSortState.text, systemImage: activeSortState.imageString)
                                                                .tag(index)
                                                        }
                                                    } label: {
                                                        Label("Sort", systemImage: "arrow.up.arrow.down")
                                                    }
                                                    .pickerStyle(.menu)
                                                    Button {
                                                        switch (remainingTeamsSortStateIndex) {
                                                        case 0:
                                                            clipboardText = arrRemainingTeamsList.sorted { $0.name < $1.name }.map(\.name).joined(separator: "\n")
                                                        case 1:
                                                            clipboardText = arrRemainingTeamsList.sorted { $0.name > $1.name }.map(\.name).joined(separator: "\n")
                                                        default:
                                                            clipboardText = arrRemainingTeamsList.sorted { $0.name < $1.name }.map(\.name).joined(separator: "\n")
                                                        }
                                                        UIPasteboard.general.setValue(clipboardText, forPasteboardType: "public.plain-text")
                                                        copyToClipboardHapticToggle.toggle()
                                                    } label : {
                                                        Label("Copy to Clipboard", systemImage: "document.on.document")
                                                    }
                                                    Divider()
                                                    Button(role: .destructive) {
                                                        isShowingSelectedTeamsSheet = false
                                                    } label: {
                                                        Text("Close")
                                                    }
                                                } label: {
                                                    Image(systemName: "ellipsis.circle")
                                                }
                                                .sensoryFeedback(.impact(flexibility: .soft, intensity: hapticsIntensity), trigger: remainingTeamsSortStateIndex)
                                                .sensoryFeedback(.impact(flexibility: .solid, intensity: hapticsIntensity), trigger: copyToClipboardHapticToggle)
                                            }
                                        }
                                        .navigationTitle("Remaining Teams")
                                        .navigationBarTitleDisplayMode(.inline)
                                    }
                                    .disabled(remainingTeamCount == 0)
                                } footer: {
                                    Text(Constants.picksListsFooterText)
                                }
                                Section("Options") {
                                    Button {
                                        isShowingClearAllAlert = true
                                    } label: {
                                        HStack {
                                            Image(systemName: "xmark.circle")
                                            Text("Clear All Picks")
                                        }
                                        .tint(.red)
                                    }
                                    .disabled(selectedTeamCount == 0)
                                    .alert(isPresented: $isShowingClearAllAlert) {
                                        Alert(title: Text(AlertConstants.clearTeamsAlertTitle),
                                              message: Text(AlertConstants.clearTeamsAlertMessage),
                                              primaryButton: .destructive(Text(AlertConstants.clearTeamsAlertConfirmButtonTitle))
                                        {
                                            selectedTeamName1 = ""
                                            selectedTeamName2 = ""
                                            selectedTeamName3 = ""
                                            selectedTeamName4 = ""
                                            selectedTeamName5 = ""
                                            selectedTeamName6 = ""
                                            selectedTeamName7 = ""
                                            selectedTeamName8 = ""
                                            selectedTeamName9 = ""
                                            selectedTeamName10 = ""
                                            selectedTeamName11 = ""
                                            selectedTeamName12 = ""
                                            selectedTeamName13 = ""
                                            selectedTeamName14 = ""
                                            selectedTeamName15 = ""
                                            selectedTeamName16 = ""
                                            selectedTeamName17 = ""
                                            
                                            clearTeamsHapticToggle.toggle()
                                        },
                                              secondaryButton: .cancel()
                                              )
                                    }
                                    .sensoryFeedback(.impact(flexibility: .rigid, intensity: hapticsIntensity), trigger: clearTeamsHapticToggle)
                                }
                            }
                            .padding(.top, -15)
                            .toolbar {
                                ToolbarItemGroup(placement: .navigationBarLeading) {
                                    Button {
                                        isShowingSelectedTeamsSheet = false
                                    } label: {
                                        Text("Close")
                                    }
                                }
                            }
                            .navigationTitle("Lists")
                            .navigationBarTitleDisplayMode(.inline)
                        }
                        .presentationDetents([.large])
                        .presentationDragIndicator(.visible)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingSettingsSheet = true
                    }
                           , label: {
                        Image(systemName: "gearshape")
                            .imageScale(.large)
                    })
                    .sensoryFeedback(.impact(weight: .light, intensity: hapticsIntensity), trigger: isShowingSettingsSheet)
                    .sheet(isPresented: $isShowingSettingsSheet) {
                        SettingsView(isShowingSettingsSheet: $isShowingSettingsSheet)
                    }
                }
            }
            .navigationTitle(titleText)
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(arrAppTints[selectedAppTintIndex].color)
        .preferredColorScheme(selectedColorScheme == "System" ? nil : selectedColorScheme == "Dark" ? .dark : .light)
    }
}

// MARK: Preview
#Preview {
    PigskinPicksMainView()
}
