//
//  OnboardingView.swift
//  Affirmations
//
//  Created by Ruslan Alekyan on 31.07.2024.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var viewModel: SettingsViewModel
    
    @State private var currentStep = 1
    
    var body: some View {
        TabView(selection: $currentStep) {
            categorySection
                .tag(1)
            backgroundSection
                .tag(2)
            genderSection
                .tag(3)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .multilineTextAlignment(.center)
    }
    
    private var categorySection: some View {
        VStack {
            Spacer()
            
            Text("Choose category of affirmations")
                .font(.title)
                .fontWeight(.semibold)
                        
            ForEach(viewModel.categories.keys.map { String($0)}.sorted(), id: \.self) { category in
                Button {
                    withAnimation {
                        viewModel.selectedCategory = category
                    }
                } label: {
                    Text(LocalizedStringKey(category))
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(category == viewModel.selectedCategory ? .accent : .secondary, lineWidth: 2)
                        )
                }
            }
            
            Spacer()
            
            NextButton(isInvalid: viewModel.selectedCategory == "") {
                currentStep += 1
            }
        }
        .padding()
    }
    
    private var backgroundSection: some View {
        VStack {
            Spacer()
            
            Text("Choose background")
                .font(.title)
                .fontWeight(.semibold)
            
            ForEach(viewModel.backgrounds, id: \.self) { background in
                Button {
                    withAnimation {
                        viewModel.selectedBackground = background
                    }
                } label: {
                    Text(LocalizedStringKey(background.description.capitalized))
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(background == viewModel.selectedBackground ? .accent : .secondary, lineWidth: 2)
                        )
                }
            }
            
            Spacer()
            
            NextButton(isInvalid: viewModel.selectedBackground == .clear) {
                currentStep += 1
            }
        }
        .padding()
    }
    
    private var genderSection: some View {
        VStack {
            Spacer()
            
            Text("Choose gender")
                .font(.title)
                .fontWeight(.semibold)
            
            ForEach(viewModel.genders, id: \.self) { gender in
                Button {
                    withAnimation {
                        viewModel.selectedGender = gender
                    }
                } label: {
                    Text(LocalizedStringKey(gender))
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(gender == viewModel.selectedGender ? .accent : .secondary, lineWidth: 2)
                        )
                }
            }
            
            Spacer()
            
            NextButton(isInvalid: viewModel.selectedGender == "") {
                viewModel.isShowOnboarding = false
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
        .environmentObject(SettingsViewModel())
}
