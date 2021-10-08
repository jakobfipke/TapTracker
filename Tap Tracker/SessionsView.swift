//
//  SessionsView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI

let sessions = [
    thisSession
]

struct SessionsView: View {
    var body: some View {
        NavigationView {
            List {
                
                ForEach(sessions, id: \.id, content: {
                    session in
                    NavigationLink(
                        destination: Text(session.name)
                    ) {
                        Text(session.name)
                    }
                })
                

            }.navigationTitle("Sessions")
        }
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
