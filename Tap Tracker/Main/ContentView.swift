//
//  ContentView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-01.
//

import SwiftUI




struct ContentView: View {
    var body: some View {
        TabView {
            SessionsView()
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Sessions")
            }
            // Tap View
            TapView()
            .tabItem {
                Image(systemName: "hand.tap")
                Text("Tap")
            }
            GraphView()
            .tabItem {
                Image(systemName: "chart.bar.xaxis")
                Text("Graph")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
