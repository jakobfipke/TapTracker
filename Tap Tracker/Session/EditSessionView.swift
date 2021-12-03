//
//  NewSessionView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-11-26.
//

import SwiftUI
import GoogleSignIn

enum NotifyMeAboutType: String {
    case directMessages
    case mentions
    case anything
}

enum ProfileImageSize: String {
    case large
    case medium
    case small
}

struct EditSessionView: View {
    //    @State var notifyMeAbout: NotifyMeAboutType = .directMessages
    //    @State var profileImageSize: ProfileImageSize = .medium
    //    @State var playNotificationSounds: Bool = false
    //    @State var sendReadReceipts: Bool = false
    @State var sessionRowViewModel: SessionRowViewModel
    @State var name: String = ""
    @State var description: String = ""
    @State var location: String = ""
    @State var ctg1: String = ""
    @State var ctg2: String = ""
    @State var ctg3: String = ""
    @State var ctg4: String = ""
    @State var isRunning: Bool = false

    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Session Info")) {
                    TextField(sessionRowViewModel.session.name, text: $name)
                        .padding(.leading, 4)
                    ZStack {
                        if description.isEmpty {
                            Text("Description")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.gray.opacity(0.5))
                                .padding(.leading, 4)
                            
                        }
                        TextEditor(text: $description)
                    }
                    TextField(sessionRowViewModel.session.location, text: $location)
                        .padding(.leading, 4)
                }
                Section(header: Text("Categories")) {
                    //                        List {
                    //                            ForEach (categoryListViewModel.categoryRowViewModels) { rvm in
                    //                                CategoryRow(ctgRVM: rvm)
                    //                            }
                    //                        }
                    TextField(sessionRowViewModel.session.categories[0].CategoryTitle, text: $ctg1).padding(.leading, 4)
                    TextField(sessionRowViewModel.session.categories[1].CategoryTitle, text: $ctg2).padding(.leading, 4)
                    TextField(sessionRowViewModel.session.categories[2].CategoryTitle, text: $ctg3).padding(.leading, 4)
                    TextField(sessionRowViewModel.session.categories[3].CategoryTitle, text: $ctg4).padding(.leading, 4)
                    
                }
            }.onAppear(perform: {
                self.name = sessionRowViewModel.session.name
                self.description = sessionRowViewModel.session.description
                self.location = sessionRowViewModel.session.location
                self.ctg1 = sessionRowViewModel.session.categories[0].CategoryTitle
                self.ctg2 = sessionRowViewModel.session.categories[1].CategoryTitle
                self.ctg3 = sessionRowViewModel.session.categories[2].CategoryTitle
                self.ctg4 = sessionRowViewModel.session.categories[3].CategoryTitle
                self.isRunning = sessionRowViewModel.session.isRunning
                
            })
            Spacer()
            Group {
                Button(action: {
                    var session: Session = sessionRowViewModel.session
                    session.name = name
                    session.description = description
                    session.location = location
                    session.categories = [Category(CategoryTitle: ctg1, Count: 0),Category(CategoryTitle: ctg2, Count: 0),Category(CategoryTitle: ctg3, Count: 0),Category(CategoryTitle: ctg4, Count: 0)]
                    sessionRowViewModel.updateSession(session: session)
                    
                }) {
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                Button(action: {
                    var session: Session = sessionRowViewModel.session
                    isRunning = !isRunning
                    session.isRunning = isRunning
                    sessionRowViewModel.updateSession(session: session)
                    if (isRunning) {
                        
                    }
                    
                }) {
                    HStack {
                        Spacer()
                        isRunning ? Text("Stop Session") : Text("Start Session")
                        
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
            }.padding()
        }
    }
}

//struct NewSessionView_Previews: PreviewProvider {
//    static var previews: some View {
////        NewSessionView()
//    }
//}
