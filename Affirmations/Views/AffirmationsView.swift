//
//  AffirmationsView.swift
//  Affirmations
//
//  Created by Ruslan Alekyan on 31.07.2024.
//

import SwiftUI

struct AffirmationsView: View {
    @EnvironmentObject private var viewModel: SettingsViewModel
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color(viewModel.selectedBackground.opacity(0.5))
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(viewModel.affirmations, id: \.self) { affirmation in
                            Text(affirmation)
                                .font(.title)
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                                .containerRelativeFrame(.vertical)
                                .padding(.horizontal)
                        }
                    }
                }
                .scrollIndicators(.never)
                .scrollTargetBehavior(.paging)
                .toolbar {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    let viewModel = SettingsViewModel()
    
    viewModel.selectedCategory = "Love"
    viewModel.selectedBackground = .red
    viewModel.selectedGender = "Male"
    
    return AffirmationsView()
        .environmentObject(viewModel)
}
