//
//  AnimalPhoto.swift
//  VisualEffects
//
//  Created by swiftandcurious on 3/15/25.
//

import SwiftUI

struct AnimalPhoto: View {
    let animal: Animal

    var body: some View {
        Image(animal.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 300)
            .cornerRadius(12)
    }
}

#Preview {
    AnimalPhoto(animal: Animal.example)
}
