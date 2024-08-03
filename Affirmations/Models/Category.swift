//
//  Category.swift
//  Affirmations
//
//  Created by Ruslan Alekyan on 02.08.2024.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let title: String
    let affirmations: [String]
}
