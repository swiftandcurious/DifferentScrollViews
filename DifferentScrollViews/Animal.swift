//
//  Animal.swift
//  VisualEffects
//
//  Created by swiftandcurious on 3/15/25.
//

import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    let imageName: String
    
    static let all: [Animal] = [
        "lion", "zebra","cheetah", "elephant",
        "giraffe", "hippo", "meerkat", "ostrich",
        "buffalo", "rhino", "wild-dog",  "gorilla"
    ].map { Animal(imageName: $0) }
    
    static let example = Animal(imageName: "elephant")
}
