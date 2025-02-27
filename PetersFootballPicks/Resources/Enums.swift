//
//  Enums.swift
//  PigskinPicks
//
//  Created by Michael Peters on 2/11/25.
//

import Foundation
import SwiftUI

// MARK: Constants used throuhgout app
enum Constants {
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    static let leagueInfoLeaguePlayerCountMinimumValue = 1
    static let leagueInfoLeaguePlayerCountMaximumValue = 200
    static let leagueInfoLeaguePlayerCountStepValue = 1
    
    static let picksListsFooterText = "Select a list above to view your current Picks as well as a listing of the Remaining Teams available for selection in future weeks."
    static let leagueInfoLeagueAdjustmentFooterText = "The Adjustment field can be used to enter any commissioner fees or other amounts that will be removed from the calculated pot below."
}

enum SettingsConstants {
    static let settingsAboutHelpContactEmailAddress = "mpappshelp@icloud.com"
    static let settingsAboutHelpContactSubjectLine = "Pigskin Picks Feedback"
    static let settingsAboutHelpContactBody = "\n\nBuild: \(Constants.appVersion!)"
    
    static let settingsAboutHelpPrivacyPolicyURL = "https://www.termsfeed.com/live/c573af58-fe93-410c-b0c4-53117e44ab9c"
    static let settingsAboutAcknowledgementsDeveloperGitHubURL = "https://github.com/PSLPeters"
}

enum AlertConstants {
    static let clearLeagueInfoAlertTitle = "Clear All League Information?"
    static let clearLeagueInfoAlertMessage = "Are you sure you would like to clear all currently selected league information?"
    static let clearLeagueInfoAlertConfirmButtonTitle = "Clear"
    
    static let clearTeamsAlertTitle = "Clear All Picks?"
    static let clearTeamsAlertMessage = "Are you sure you would like to clear all currently selected teams?"
    static let clearTeamsAlertConfirmButtonTitle = "Clear"
}

enum FocusedField {
    case leagueInfoLeagueName
    case leagueInfoLeagueBuyIn
    case leagueInfoLeagueAdjustment
}
