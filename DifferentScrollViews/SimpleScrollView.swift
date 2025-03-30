//
//  SimpleScrollView.swift
//  DifferentScrollViews
//
//  Created by swiftandcurious on 3/15/25.
//

import SwiftUI

struct SimpleScrollView: View {
    
    let animals = Animal.all
    
    var body: some View {
        
        VStack {
            
            Text("Simple ScrollView")
                .font(.title.bold())
            
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(spacing: 20) {
                    ForEach(animals) { animal in
                        VStack {
                            AnimalPhoto(animal: animal)
                                .padding(.bottom, 12)
                            
                            Text(animal.imageName.capitalized)
                                .font(.title2)
                        }
                    }
                }
            }
            .frame(height: 300)
            
            Text("Pagination Effect")
                .font(.title.bold())
            
            GeometryReader { geometry in
                let screenWidth = geometry.size.width
                let imageFrameWidth = screenWidth * 0.8
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(animals) { animal in
                            VStack {
                                AnimalPhoto(animal: animal)
                                    .frame(width: imageFrameWidth)
                                
                                Text(animal.imageName.capitalized)
                                    .font(.title2)
                            }
                        }
                        
                    }
                    .scrollTargetLayout()
                    .padding(.horizontal, (screenWidth - imageFrameWidth) / 2)
                }
                .scrollTargetBehavior(.viewAligned)
                
            }
            .frame(height: 300)
            
            Spacer()
        }
    }
}

#Preview {
    SimpleScrollView()
}
