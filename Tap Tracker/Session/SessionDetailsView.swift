//
//  SessionDetailsView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-11-26.
//

import SwiftUI

enum SessionDetailsViewType {
    case details
    case edit
}

struct SessionDetailsView: View {
    @State var viewType: SessionDetailsViewType = .details
    @State var session: Session
    @State var sessionRowViewModel: SessionRowViewModel
    
    var body: some View {
        VStack {
            switch viewType {
            case .details:
                SessionCard(session: session)
            case .edit:
                EditSessionView(sessionRowViewModel: sessionRowViewModel)
            }
            
            Group {
                switch viewType {
                case .details:
                    Button(action: {
                        self.viewType = .edit
                    }) {
                        HStack {
                            Text("Edit")
                            Spacer()
                            Image(systemName: "pencil.circle")
                                .foregroundColor(Color.white)
                                .padding(.trailing, 20.0)
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                case .edit:
                    EmptyView()
                }
            }.padding()
        }
        
        
    }
}

//struct SessionDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionDetailsView(session: SessionRestaurant, sessionRowViewModel: SessionRowViewModel(SessionRestaurant))
//    }
//}
