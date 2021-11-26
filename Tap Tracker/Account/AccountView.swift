//
//  AccountView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-11-15.
//

import SwiftUI
import Firebase
import GoogleSignIn
//import FirebaseAuthUI
//import FirebaseEmailAuthUI

//struct SignInButton: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> GIDSignInButton {
//        return GIDSignInButton()
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {}
//}

struct AccountView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    private var user: GIDGoogleUser? {
      return GIDSignIn.sharedInstance.currentUser
    }
//    @State var email: String = ""
//    @State var password: String = ""
//    @State var loading = false
//    @State var error = false
    
//    @ObservedObject var userSession: SessionStore
    
//    func getUser() {
//        userSession.listen()
//    }
//
//    func signInEmail () {
//        loading = true
//        error = false
//        userSession.signIn(email: email, password: password) { (result, error) in
//            self.loading = false
//            if error != nil {
//                self.error = true
//            } else {
//                self.email = ""
//                self.password = ""
//            }
//        }
//    }
//
//    func signInGoogle(sender: Any) {
//      GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: UIViewController()) { user, error in
//        guard error == nil else { return }
//
//        // If sign in succeeded, display the app's main content View.
//      }
//    }
    
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
//        VStack {
//            if (userSession.session != nil) {
//                Text(Auth.auth().currentUser?.uid ?? "")
//            } else {
//                VStack {
//                    TextField("Email", text: $email)
//                    SecureField("Password", text: $password)
//                    if (error) {
//                        Text("ahhh crap")
//                    }
//                    Button(action: signInEmail) {
//                        Text("Sign in")
//                    }
////                    SignInButton().onTapGesture {
////                        signInGoogle(sender: "ME")
////                    }
//                }
//            }
//
////            AccountViewController()
//        }.onAppear(perform: getUser)
        
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
