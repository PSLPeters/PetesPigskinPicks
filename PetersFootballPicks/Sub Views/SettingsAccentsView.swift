//
//  SettingsAccentsView.swift
//  PigskinPicks
//
//  Created by Michael Peters on 2/18/25.
//

import SwiftUI

struct SettingsAccentsView: View {
    
    // MARK: AppStorage variables
    @AppStorage("selectedColorScheme") var selectedColorScheme = ""
    @AppStorage("selectedAppTintIndex") var selectedAppTintIndex = 0
    
    var body: some View {
        Form {
            Picker("Select an accent color", selection: $selectedAppTintIndex) {
                ForEach(arrAppTints.indices, id:\.self) { index in
                    let activeAppTint = arrAppTints[index]
                    HStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 30, height: 15)
                            .padding(.trailing)
                            .foregroundStyle(activeAppTint.color)
                        Text(activeAppTint.text)
                    }
                    .tag(index)
                }
            }
            .pickerStyle(.inline)
        }
        .tint(arrAppTints[selectedAppTintIndex].color)
        .preferredColorScheme(selectedColorScheme == "System" ? nil : selectedColorScheme == "Dark" ? .dark : .light)
    }
}

#Preview {
    SettingsAccentsView()
}
