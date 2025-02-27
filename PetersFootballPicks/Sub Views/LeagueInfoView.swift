//
//  LeagueInfoView.swift
//  PigskinPicks
//
//  Created by Michael Peters on 2/21/25.
//

import SwiftUI

struct LeagueInfoView: View {
    
    // MARK: AppStorage variables
    @AppStorage("selectedColorScheme") var selectedColorScheme = ""
    @AppStorage("selectedAppTintIndex") var selectedAppTintIndex = 0
    @AppStorage("doHaptics") private var doHaptics = true
    
    // MARK: @State variables
    @State private var isShowingClearLeagueAlert = false
    
    // MARK: Other variables
    @Binding var leagueInfoLeagueName: String
    @Binding var leagueInfoLeagueBuyIn: Double
    @Binding var leagueInfoLeaguePlayerCount: Double
    @Binding var leagueInfoLeagueAdjustment: Double
    @Binding var leagueinfoLeaguePotValue: Double
    @Binding var isShowingSettingsSheet: Bool
    
    @FocusState private var focusedField: FocusedField?
    
    // MARK: Haptic toggles
    @State private var clearLeagueInfoHapticToggle = false
    
    // MARK: Body
    var body: some View {
        // MARK: Calculated variables
        var hapticsIntensity: Double {
            doHaptics ? 1.0 : 0.0
        }
        
        NavigationStack {
            List {
                Section {
                    LabeledContent("League Name") {
                        TextField("Enter league name here", text: $leagueInfoLeagueName)
                            .focused($focusedField, equals: .leagueInfoLeagueName)
                            .textInputAutocapitalization(.words)
                    }
                    LabeledContent("Buy In") {
                        TextField("Enter league buy in here", value: $leagueInfoLeagueBuyIn, format: .number)
                            .focused($focusedField, equals: .leagueInfoLeagueBuyIn)
                            .keyboardType(.decimalPad)
                    }
                    VStack {
                        LabeledContent("Players") {
                            Text(String(Int(leagueInfoLeaguePlayerCount)))
                        }
                        HStack {
                            Button {
                                leagueInfoLeaguePlayerCount -= Double(Constants.leagueInfoLeaguePlayerCountStepValue)
                            } label: {
                                Image(systemName: "minus.circle")
                                    .imageScale(.large)
                            }
                            .disabled(leagueInfoLeaguePlayerCount == Double(Constants.leagueInfoLeaguePlayerCountMinimumValue))
                            Slider(value: $leagueInfoLeaguePlayerCount,
                                   in: Double(Constants.leagueInfoLeaguePlayerCountMinimumValue)...Double(Constants.leagueInfoLeaguePlayerCountMaximumValue),
                                   step: Double(Constants.leagueInfoLeaguePlayerCountStepValue)) {
                                Text("Players")
                            } minimumValueLabel: {
                                Text(String(Constants.leagueInfoLeaguePlayerCountMinimumValue))
                            } maximumValueLabel: {
                                Text(String(Constants.leagueInfoLeaguePlayerCountMaximumValue))
                            }
                            Button {
                                leagueInfoLeaguePlayerCount += Double(Constants.leagueInfoLeaguePlayerCountStepValue)
                            } label: {
                                Image(systemName: "plus.circle")
                                    .imageScale(.large)
                            }
                            .disabled(leagueInfoLeaguePlayerCount == Double(Constants.leagueInfoLeaguePlayerCountMaximumValue))
                        }
                        .sensoryFeedback(.impact(flexibility: .soft, intensity: hapticsIntensity), trigger: leagueInfoLeaguePlayerCount)
                    }
                    .buttonStyle(.borderless)
                    LabeledContent("Adjustment") {
                        TextField("Enter league adjustment here", value: $leagueInfoLeagueAdjustment, format: .number)
                            .focused($focusedField, equals: .leagueInfoLeagueAdjustment)
                            .keyboardType(.decimalPad)
                    }
                } header: {
                    Text("Information")
                } footer: {
                    Text(Constants.leagueInfoLeagueAdjustmentFooterText)
                        .multilineTextAlignment(.leading)
                }
                Section("Possible Earnings") {
                    LabeledContent("Calculated Pot") {
                        Text(leagueinfoLeaguePotValue, format: .currency(code: "USD"))
                            .foregroundStyle(arrAppTints[selectedAppTintIndex].color)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .task(id: leagueInfoLeagueBuyIn) {
                leagueinfoLeaguePotValue = (leagueInfoLeagueBuyIn * Double(leagueInfoLeaguePlayerCount)) - leagueInfoLeagueAdjustment
            }
            .task(id: leagueInfoLeaguePlayerCount) {
                leagueinfoLeaguePotValue = (leagueInfoLeagueBuyIn * Double(leagueInfoLeaguePlayerCount)) - leagueInfoLeagueAdjustment
            }
            .task(id: leagueInfoLeagueAdjustment) {
                leagueinfoLeaguePotValue = (leagueInfoLeagueBuyIn * Double(leagueInfoLeaguePlayerCount)) - leagueInfoLeagueAdjustment
            }
            .multilineTextAlignment(.trailing)
            .onAppear() {
                leagueInfoLeagueName = leagueInfoLeagueName.trimmingCharacters(in: .whitespaces)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            isShowingClearLeagueAlert = true
                        } label: {
                            Text("Clear League Info")
                        }
                        Divider()
                        Button(role: .destructive) {
                            isShowingSettingsSheet = false
                        } label: {
                            Text("Close")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        focusedField = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
            .alert(isPresented: $isShowingClearLeagueAlert) {
                Alert(title: Text(AlertConstants.clearLeagueInfoAlertTitle),
                      message: Text(AlertConstants.clearLeagueInfoAlertMessage),
                      primaryButton: .destructive(Text(AlertConstants.clearLeagueInfoAlertConfirmButtonTitle))
                {
                    leagueInfoLeagueName = ""
                    leagueInfoLeagueBuyIn = 0
                    leagueInfoLeaguePlayerCount = 1
                    leagueInfoLeagueAdjustment = 0
                    
                    clearLeagueInfoHapticToggle.toggle()
                },
                      secondaryButton: .cancel()
                      )
            }
            .sensoryFeedback(.impact(flexibility: .rigid, intensity: hapticsIntensity), trigger: clearLeagueInfoHapticToggle)
            .navigationTitle("League Information")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(arrAppTints[selectedAppTintIndex].color)
        .preferredColorScheme(selectedColorScheme == "System" ? nil : selectedColorScheme == "Dark" ? .dark : .light)
    }
}

// MARK: Preview
#Preview {
    @Previewable @State var isShowingSettingsSheet = false
    @Previewable @State var leagueInfoLeagueName = ""
    @Previewable @State var leagueInfoLeagueBuyIn = 0.0
    @Previewable @State var leagueInfoLeaguePlayerCount = 0.0
    @Previewable @State var leagueInfoLeagueAdjustment = 0.0
    @Previewable @State var leagueinfoLeaguePotValue = 0.0
    
    LeagueInfoView(
        leagueInfoLeagueName: $leagueInfoLeagueName,
        leagueInfoLeagueBuyIn: $leagueInfoLeagueBuyIn,
        leagueInfoLeaguePlayerCount: $leagueInfoLeaguePlayerCount,
        leagueInfoLeagueAdjustment: $leagueInfoLeagueAdjustment,
        leagueinfoLeaguePotValue: $leagueinfoLeaguePotValue,
        isShowingSettingsSheet: $isShowingSettingsSheet
    )
}
