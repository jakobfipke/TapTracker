//
//  SessionsView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI
import GoogleSignIn

struct SessionsView: View {
    @ObservedObject var sessionListViewModel = SessionListViewModel()
    private var user: GIDGoogleUser? {
      return GIDSignIn.sharedInstance.currentUser
    }
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Sessions")) {
                        ForEach(sessionListViewModel.sessionRowViewModels, id: \.id, content: {
                            s in
                            NavigationLink(
                                destination: SessionDetailsView(session: s.session, sessionRowViewModel: s)
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
                            self.sessionListViewModel.addSession(session: Session(userId: GIDSignIn.sharedInstance.currentUser?.userID ?? "no", name: "New Session", description: "", date: Date(), location: "Vancouver", isRunning: false, categories: [Category(CategoryTitle: "Category 1", Count: 0), Category(CategoryTitle: "Category 2", Count: 0),Category(CategoryTitle: "Category 3", Count: 0),Category(CategoryTitle: "Category 4", Count: 0)]))
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
