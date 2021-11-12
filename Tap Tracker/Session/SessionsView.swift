//
//  SessionsView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI

struct SessionsView: View {
    @ObservedObject var sessionListViewModel = SessionListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(sessionListViewModel.sessionRowViewModels, id: \.id, content: {
                        s in
                        NavigationLink(
                            destination: SessionCard(session: s.session)
                        ) {
                            Text(s.session.name)
                            if (s.session.isRunning == true) {
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(Color.blue)
                                    .padding(.trailing, 20.0)
                            }
                        }
                    })
                }.navigationTitle("Sessions")
                Button(action: {
                    sessions.forEach({session in
                        self.sessionListViewModel.addSession(session: session)
                    })
                }, label: {
                   HStack {
                      Image(systemName: "plus.circle.fill")
                      Text("Add Sessions")
                   }
                })
                .padding()
            }
        }
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
