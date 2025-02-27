//
//  PickerView.swift
//  PigskinPicks
//
//  Created by Michael Peters on 2/14/25.
//

import SwiftUI

struct PickerView: View {
    
    // MARK: AppStorage variables
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
    
    // MARK: @State variables
    
    // MARK: Other variables
    let title: String
    let selectedTeamName: Binding<String>
    let selectedTeamNamePrior: Binding<String>
    let arrFootballTeams: [footballTeam]
    
    // MARK: Body
    var body: some View {
        HStack {
            Picker(title, selection: selectedTeamName) {
                ForEach(arrFootballTeams.indices, id:\.self) { index in
                    Text(arrFootballTeams[index].name)
                        .tag(arrFootballTeams[index].name)
                    if index == 0 {
                        Divider()
                    }
                }
            }
        }
        .disabled(selectedTeamNamePrior.wrappedValue.isEmpty)
    }
}

// MARK: @Other variables
#Preview {
    PickerView(
        title: "Week #1",
        selectedTeamName: .constant("Dallas (DAL)"),
        selectedTeamNamePrior: .constant("Miami (MIA)"),
        arrFootballTeams: [
            footballTeam(name: ""),
            footballTeam(name: "Arizona (ARI)"),
            footballTeam(name: "Atlanta (ATL)")
        ]
    )
}
