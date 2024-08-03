//
//  ContentView.swift
//  Affirmations
//
//  Created by Ruslan Alekyan on 31.07.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isShowOnboarding {
                    OnboardingView()
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
