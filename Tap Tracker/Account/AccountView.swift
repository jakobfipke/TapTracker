//
//  AccountView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-11-15.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct AccountView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    private var user: GIDGoogleUser? {
      return GIDSignIn.sharedInstance.currentUser
    }

    
    var body: some View {
        return Group {
          if let userProfile = user?.profile {
            VStack {
              HStack(alignment: .top) {
                VStack(alignment: .leading) {
                  Text(userProfile.name)
                    .accessibilityLabel(Text("User name."))
                  Text(userProfile.email)
                    .accessibilityLabel(Text("User email."))
                    .foregroundColor(.gray)
                }
                Spacer()
              }
              .padding()
              Spacer()
            }
            
          } else {
            Text("Failed to get user profile!")
              .accessibilityLabel(Text("Failed to get user profile"))
          }
        }
        
    }
    
    func signOut() {
      authViewModel.signOut()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
//        AccountView(userSession: SessionStore())
        AccountView()
    }
}
