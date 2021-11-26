//
//  SessionsView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI

struct SessionsView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(sessions, id: \.id, content: {
                    session in
                    NavigationLink(
                        destination: SessionCard(session: session)
                    ) {
                        Text(session.name)
                        if (session.isRunning == true) {
                            Spacer()
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color.blue)
                                .padding(.trailing, 20.0)
                        }
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
