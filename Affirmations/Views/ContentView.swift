//
//  ContentView.swift
//  Affirmations
//
//  Created by Ruslan Alekyan on 31.07.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        NavigationStack {
            VStack {
                if showOnboarding {
                    OnboardingView(showOnboarding: $showOnboarding)
                } else {
                    AffirmationsView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(SettingsViewModel())
}
