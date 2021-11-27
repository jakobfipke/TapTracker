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
                    Section(header: Text("Sessions")) {
                        ForEach(sessionListViewModel.sessionRowViewModels, id: \.id, content: {
                            s in
                            NavigationLink(
                                destination: SessionDetailsView(session: s.session)
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
                        .onDelete(perform: { indexSet in
                            indexSet.forEach({ index in
                                self.sessionListViewModel.deleteSession(session: self.sessionListViewModel.sessionRowViewModels[index].session)
                            })
                        })
                    }
//                    Section {
                        Button(action: {
                            self.sessionListViewModel.addSession(session: NewSession)
                        }, label: {
                            
                            HStack {
                                Text("Create New Session")
                                Spacer()
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(Color.blue)
                                    .padding(.trailing, 20.0)
                            }
                            
                        })
//                    }
                }
                
                
//                NavigationLink(
//                    destination: NewSessionView()
//                    
//                ) {
//                    Text("Create New Session")
//                    Spacer()
//                    Image(systemName: "plus.circle.fill")
//                        .foregroundColor(Color.blue)
//                        .padding(.trailing, 20.0)
//                    
//                }.padding()
            }
            
        }
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
