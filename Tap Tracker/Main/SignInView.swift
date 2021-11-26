//
//  SignInView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-11-26.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to Tap Tracker!")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            Text("Please sign in with Google to get started.")
                .font(.body)
                .padding()
            GoogleSignInButtonWrapper(handler: viewModel.signIn)
                .accessibility(hint: Text("Sign in with Google button."))
                .padding()
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
