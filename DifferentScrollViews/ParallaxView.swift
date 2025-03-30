//
//  ParallaxView.swift
//  DifferentScrollViews
//
//  Created by swiftandcurious on 3/15/25.
//

import SwiftUI

struct ParallaxView: View {
    
    let animals = Animal.all
    
    var body: some View {
        
        VStack {
            Text("Parallax Effect")
                .font(.title.bold())
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 18) {
                    ForEach(animals) { animal in
                        VStack {
                            AnimalPhoto(animal: animal)
                                .scrollTransition(axis: .horizontal) { content, phase in
                                    content
                                        .offset(x: phase.isIdentity ? 0 : phase.value * -200)
                                }
                                .containerRelativeFrame(.horizontal)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .padding(.bottom, 12)
                            
                            Text(animal.imageName.capitalized)
                                .font(.title2)
                                .scrollTransition(axis: .horizontal) { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0)
                                        .offset(x: phase.value * 100)
                                }
                        }
                    }
                }
            }
            .contentMargins(36)
            .scrollTargetBehavior(.paging)
            .frame(height: 350)
            
            GeometryReader { geometry in
                let screenWidth = geometry.size.width
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0) {
                            ForEach(animals) { animal in
                                GeometryReader { proxy in
                                    let scrollOffset = proxy.frame(in: .global).minX
                                    
                                    VStack(spacing: 8) {
                                        AnimalPhoto(animal: animal)
                                            .frame(width: screenWidth)
                                            .offset(x: -scrollOffset)
                                            .containerRelativeFrame(.horizontal)
                                            .clipShape(Rectangle())
                                            .padding(.bottom, 12)
                                        
                                        Text(animal.imageName.capitalized)
                                            .font(.title2)
                                            .scrollTransition(axis: .horizontal) { content, phase in
                                                content
                                                    .opacity(phase.isIdentity ? 1 : 0)
                                                    .offset(x: -scrollOffset)
                                            }
                                    }
                                }
                                .frame(width: screenWidth)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.paging)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ParallaxView()
}
