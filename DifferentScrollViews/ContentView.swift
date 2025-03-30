//
//  ContentView.swift
//  DifferentScrollViews
//
//  Created by swiftandcurious on 3/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SimpleScrollView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Simple Scroll")
                }
            
            SimpleTabView()
                .tabItem {
                    Image(systemName: "square.and.arrow.up")
                    Text("Simple Tab")
                }
            
            ParallaxView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Parallax")
                }
        }
    }
}

#Preview {
    ContentView()
}
