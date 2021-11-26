//
//  GoogleSignInAuthenticator.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-11-26.
//

import Foundation
import GoogleSignIn
import Firebase

/// An observable class for authenticating via Google.
final class GoogleSignInAuthenticator: ObservableObject {
    private let clientID = "107387806234-hbvr9mnteo4gkashccb5bqqtbb21tjhi.apps.googleusercontent.com"
    
    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: clientID)
    }()
    
    private var authViewModel: AuthenticationViewModel
    
    /// Creates an instance of this authenticator.
    /// - parameter authViewModel: The view model this authenticator will set logged in status on.
    init(authViewModel: AuthenticationViewModel) {
        self.authViewModel = authViewModel
    }
    
    /// Signs in the user based upon the selected account.'
    /// - note: Successful calls to this will set the `authViewModel`'s `state` property.
    func signIn() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("There is no root view controller!")
            return
        }
        GIDSignIn.sharedInstance.signIn(with: configuration,
                                        presenting: rootViewController) { user, error in
            guard let user = user else {
                print("Error! \(String(describing: error))")
                return
            }
            let authentication = user.authentication
            
            guard let idToken = authentication.idToken else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential)
            self.authViewModel.state = .signedIn(user)
        }
        
        
    }
    
    /// Signs out the current user.
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        authViewModel.state = .signedOut
    }
}

