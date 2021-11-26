//
//  Tap_TrackerApp.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-01.
//

import SwiftUI
import Firebase
import GoogleSignIn
//import FirebaseAuthUI

let signInConfig = GIDConfiguration.init(clientID: "107387806234-hbvr9mnteo4gkashccb5bqqtbb21tjhi.apps.googleusercontent.com")

@main
struct Tap_TrackerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var authViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        if let user = user {
                            self.authViewModel.state = .signedIn(user)
                        } else if let error = error {
                            self.authViewModel.state = .signedOut
                            print("There was an error restoring the previous sign-in: \(error)")
                        } else {
                            self.authViewModel.state = .signedOut
                        }
                    }
                }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

//extension Tap_TrackerApp {
//    func setupAuthentication() {
//        FirebaseApp.configure()
//
//
//    }
//}

