//
//  SettingsViewModel.swift
//  Affirmations
//
//  Created by Ruslan Alekyan on 31.07.2024.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    @Published var selectedCategory = "" {
        didSet {
            saveCategory()
        }
    }
    @Published var selectedBackground = Color.clear {
        didSet {
            saveBackground()
        }
    }
    @Published var selectedGender = "" {
        didSet {
            saveGender()
        }
    }
    
    @Published var isShowOnboarding = true {
        didSet {
            saveIsShowOnboarding()
        }
    }
    
    init() {
        loadSettins()
        categories = decodeCategories()
    }
    
    var categories = [String: [String]]()
    let backgrounds = [Color.red, .blue]
    let genders = ["Male", "Female"]
    
    var affirmations: [String] {
        categories[selectedCategory] ?? []
    }
    
    private func decodeCategories() -> [String: [String]] {
        let languageCode = Locale.current.language.languageCode!.identifier
        
        guard let url = Bundle.main.url(forResource: "Categories_\(languageCode)", withExtension: "json") else { return [:] }
        
        var categories = [String: [String]]()
        
        do {
            let data = try Data(contentsOf: url)
            let array = try JSONDecoder().decode([Category].self, from: data)
            
            for element in array {
                categories[element.title] = element.affirmations
            }
        } catch {
            print("error: \(error.localizedDescription)")
        }
        
        return categories
    }
    
    // MARK: - Save & Load
    
    private func saveCategory() {
        UserDefaults.standard.set(selectedCategory, forKey: "category")
    }
    
    private func saveBackground() {
        let color = UIColor(selectedBackground).cgColor
        
        if let components = color.components {
            UserDefaults.standard.set(components, forKey: "background")
        }
    }
    
    private func saveGender() {
        UserDefaults.standard.set(selectedGender, forKey: "gender")
    }
    
    private func saveIsShowOnboarding() {
        UserDefaults.standard.set(isShowOnboarding, forKey: "isShowOnboarding")
    }
    
    private func loadSettins() {
        selectedCategory = UserDefaults.standard.string(forKey: "category") ?? ""
        selectedGender = UserDefaults.standard.string(forKey: "gender") ?? ""
        isShowOnboarding = UserDefaults.standard.bool(forKey: "isShowOnboarding")
        
        if let components = UserDefaults.standard.object(forKey: "background") as? [CGFloat] {
            let color = Color(.sRGB, red: components[0], green: components[1], blue: components[2], opacity: components[3])
            selectedBackground = color
        }
    }
}
