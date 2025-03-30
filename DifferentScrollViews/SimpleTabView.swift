//
//  SimpleTabView.swift
//  DifferentScrollViews
//
//  Created by swiftandcurious on 3/15/25.
//

import SwiftUI

struct SimpleTabView: View {
    
    let animals = Animal.all
    
    var body: some View {
        
        VStack {
            Text("TabView")
                .font(.title.bold())
            
            TabView {
                ForEach(animals) { animal in
                    VStack {
                        AnimalPhoto(animal: animal)
                            .padding(.bottom, 12)
                        
                        Text(animal.imageName.capitalized)
                            .font(.title2)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 350)
            .padding(.bottom, 20)
            .padding(.top, -40)
            
            Spacer()
        }
    }
}

#Preview {
    SimpleTabView()
}
