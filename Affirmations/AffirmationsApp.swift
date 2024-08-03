//
//  AffirmationsApp.swift
//  Affirmations
//
//  Created by Ruslan Alekyan on 31.07.2024.
//

import SwiftUI

@main
struct AffirmationsApp: App {
    @StateObject private var viewModel = SettingsViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
