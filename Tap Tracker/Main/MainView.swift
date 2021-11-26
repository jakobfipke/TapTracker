//
//  MainView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-11-26.
//

import SwiftUI

enum Tabs: String {
    case sessions = "Sessions"
    case tap = "Tap"
    case graph = "Graph"
    case account = "Account"
}

struct MainView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State var selectedTab: Tabs = .tap
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SessionsView()
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Sessions")
            }
            .tag(Tabs.sessions)
            
            TapView()
            .tabItem {
                Image(systemName: "hand.tap")
                Text("Tap")
            }
            .tag(Tabs.tap)
            
            GraphView()
            .tabItem {
                Image(systemName: "chart.bar.xaxis")
                Text("Graph")
            }
            .tag(Tabs.graph)
            
            AccountView()
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Account")
            }
            .tag(Tabs.account)
        }
        .toolbar {
          ToolbarItemGroup(placement: .navigationBarTrailing) {
            Button("Sign Out", action: signOut)
              .accessibilityLabel(Text("Sign out button"))
          }
        }
        .navigationTitle(selectedTab.rawValue)
    }
    
    func signOut() {
      authViewModel.signOut()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
