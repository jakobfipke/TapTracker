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
    
    var body: some View {
        VStack {
            switch viewType {
            case .details:
                SessionCard(session: session)
            case .edit:
                EditSessionView()
            }
            
            
            VStack {
                switch viewType {
                case .details:
                    Button(action: {
                        self.viewType = .edit
                    }) {
                        HStack {
                            Text("Edit")
                            Spacer()
                            Image(systemName: "pencil.circle")
                                .foregroundColor(Color.blue)
                                .padding(.trailing, 20.0)
                        }
                    }
                case .edit:
                    Button(action: {
                        self.viewType = .details
                    }) {
                        Text("Save")
                    }
                }
                
            }.padding(.all)
            Spacer()
        }
        
        
    }
}

struct SessionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailsView(session: SessionRestaurant)
    }
}
