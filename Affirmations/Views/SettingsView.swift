//
//  SettingsView.swift
//  Affirmations
//
//  Created by Ruslan Alekyan on 31.07.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var viewModel: SettingsViewModel
    
    var body: some View {
        List {
            Section("General") {
                Picker(selection: $viewModel.selectedCategory) {
                    ForEach(viewModel.categories.keys.map { String($0)}.sorted(), id: \.self) { category in
                        Text(LocalizedStringKey(category))
                    }
                } label: {
                    Label("Category", systemImage: "square.grid.3x3.fill")
                }
                
                Picker(selection: $viewModel.selectedBackground) {
                    ForEach(viewModel.backgrounds, id: \.self) { background in
                        Text(LocalizedStringKey(background.description.capitalized))
                    }
                } label: {
                    Label("Background", systemImage: "paintpalette")
                }
                
                Picker(selection: $viewModel.selectedGender) {
                    ForEach(viewModel.genders, id: \.self) { gender in
                        Text(LocalizedStringKey(gender))
                    }
                } label: {
                    Label("Gender", systemImage: "person")
                }
                
                Button {
                    if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(settingsUrl)
                    }
                } label: {
                    HStack {
                        Label("Language", systemImage: "globe")
                        Spacer()
                        Text(Locale.current.localizedString(forLanguageCode: Locale.current.language.languageCode!.identifier)!.capitalized)
                            .foregroundStyle(.secondary)
                    }
                }
                .buttonStyle(.plain)
            }
            .pickerStyle(.navigationLink)
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .environmentObject(SettingsViewModel())
    }
}
