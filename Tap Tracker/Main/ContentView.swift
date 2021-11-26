//
//  ContentView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-01.
//

import SwiftUI



struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel

    var body: some View {
      return Group {
        NavigationView {
          switch authViewModel.state {
          case .signedIn:
            MainView()
          case .signedOut:
            SignInView()
          }
        }
        .navigationViewStyle(StackNavigationViewStyle())
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
