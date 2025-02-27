//
//  PickerData.swift
//  PigskinPicks
//
//  Created by Michael Peters on 3/13/24.
//

import Foundation
import SwiftUI

// MARK: Color Schemes
struct colorScheme : Identifiable {
    let id = UUID()
    let name : String
    let image : Image
}

let arrColorSchemes =
    [
        colorScheme(name: "System", image: Image(systemName: "lightbulb.led")),
        colorScheme(name: "Dark", image: Image(systemName: "lightbulb")),
        colorScheme(name: "Light", image: Image(systemName: "lightbulb.fill"))
    ]

// MARK: App Tints
struct appTint : Identifiable {
    let id = UUID()
    let text : String
    let color : Color
}

let arrAppTints =
    [
        appTint(text: "Blue (Default)", color: .blue),
        appTint(text: "Brown", color: .brown),
        appTint(text: "Cyan", color: .cyan),
        appTint(text: "Gray", color: .gray),
        appTint(text: "Green", color: .green),
        appTint(text: "Indigo", color: .indigo),
        appTint(text: "Mint", color: .mint),
        appTint(text: "Orange", color: .orange),
        appTint(text: "Pink", color: .pink),
        appTint(text: "Purple", color: .purple),
        appTint(text: "Red", color: .red),
        appTint(text: "Teal", color: .teal),
        appTint(text: "White", color: .white),
        appTint(text: "Yellow", color: .yellow)
    ]


// MARK: Week Displays
struct weekDisplay : Identifiable {
    let id = UUID()
    let textString : String
    let dateString : String
}

let arrWeekDisplays =
    [
        weekDisplay(textString: "Week #1", dateString: "09/07/2025"),
        weekDisplay(textString: "Week #2", dateString: "09/14/2025"),
        weekDisplay(textString: "Week #3", dateString: "09/21/2025"),
        weekDisplay(textString: "Week #4", dateString: "09/28/2025"),
        weekDisplay(textString: "Week #5", dateString: "10/05/2025"),
        weekDisplay(textString: "Week #6", dateString: "10/12/2025"),
        weekDisplay(textString: "Week #7", dateString: "10/19/2025"),
        weekDisplay(textString: "Week #8", dateString: "10/26/2025"),
        weekDisplay(textString: "Week #9", dateString: "11/02/2025"),
        weekDisplay(textString: "Week #10", dateString: "11/09/2025"),
        weekDisplay(textString: "Week #11", dateString: "11/16/2025"),
        weekDisplay(textString: "Week #12", dateString: "11/23/2025"),
        weekDisplay(textString: "Week #13", dateString: "11/30/2025"),
        weekDisplay(textString: "Week #14", dateString: "12/07/2025"),
        weekDisplay(textString: "Week #15", dateString: "12/14/2025"),
        weekDisplay(textString: "Week #16", dateString: "12/21/2025"),
        weekDisplay(textString: "Week #17", dateString: "12/28/2025")
    ]

// MARK: Football Teams
struct footballTeam : Identifiable, Hashable {
    let id = UUID()
    let name : String
}

let arrFootballTeams =
[
    footballTeam(name: ""),
    footballTeam(name: "Arizona (ARI)"),
    footballTeam(name: "Atlanta (ATL)"),
    footballTeam(name: "Baltimore (BAL)"),
    footballTeam(name: "Buffalo (BUF)"),
    footballTeam(name: "Carolina (CAR)"),
    footballTeam(name: "Chicago (CHI)"),
    footballTeam(name: "Cincinnati (CIN)"),
    footballTeam(name: "Cleveland (CLE)"),
    footballTeam(name: "Dallas (DAL)"),
    footballTeam(name: "Denver (DEN)"),
    footballTeam(name: "Detroit (DET)"),
    footballTeam(name: "Green Bay (GB)"),
    footballTeam(name: "Houston (HOU)"),
    footballTeam(name: "Indianapolis (IND)"),
    footballTeam(name: "Jacksonville (JAX)"),
    footballTeam(name: "Kansas City (KC)"),
    footballTeam(name: "Las Vegas (LV)"),
    footballTeam(name: "Los Angeles (LAC)"),
    footballTeam(name: "Los Angeles (LAR)"),
    footballTeam(name: "Miami (MIA)"),
    footballTeam(name: "Minnesota (MIN)"),
    footballTeam(name: "New England (NE)"),
    footballTeam(name: "New Orleans (NO)"),
    footballTeam(name: "New York (NYJ)"),
    footballTeam(name: "New York (NYG)"),
    footballTeam(name: "Philadelphia (PHI)"),
    footballTeam(name: "Pittsburgh (PIT)"),
    footballTeam(name: "San Francisco (SF)"),
    footballTeam(name: "Seattle (SEA)"),
    footballTeam(name: "Tampa Bay (TB)"),
    footballTeam(name: "Tennessee (TEN)"),
    footballTeam(name: "Washington (WAS)")
]

// MARK: Selected Teams Sorting
struct selectedTeamsSortState : Identifiable {
    let id = UUID()
    let index : Int
    let text : String
    let imageString : String
}

let arrSelectedTeamsSortState : [selectedTeamsSortState] =
[
    selectedTeamsSortState(index: 0, text: "Team Name", imageString: "chevron.up"),
    selectedTeamsSortState(index: 1, text: "Team Name", imageString: "chevron.down"),
    selectedTeamsSortState(index: 2, text: "Date Added", imageString: "chevron.up"),
    selectedTeamsSortState(index: 3, text: "Date Added", imageString: "chevron.down")
]

// MARK: Remaining Teams Sorting
struct remainingTeamsSortState : Identifiable {
    let id = UUID()
    let index : Int
    let text : String
    let imageString : String
}

let arrRemainingTeamsSortState : [remainingTeamsSortState] =
[
    remainingTeamsSortState(index: 0, text: "Team Name", imageString: "chevron.up"),
    remainingTeamsSortState(index: 1, text: "Team Name", imageString: "chevron.down")
]

// MARK: Include in Title
struct titleItem : Identifiable {
    let id = UUID()
    let name : String
}

let arrTitleItems =
    [
        titleItem(name: "None"),
        titleItem(name: "Buy In"),
        titleItem(name: "Calculated Pot")
    ]
