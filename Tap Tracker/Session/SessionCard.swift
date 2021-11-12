//
//  SessionCard.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

// Session property
// let id = UUID()
// var name: String
// var description: String
// var date: Date
// var location: String
// var isRunning: Bool
// var categories: Array<Category>

import SwiftUI


struct SessionCard: View {
    @State var session: Session
    let dateFormatter = DateFormatter()
    var body: some View {
        VStack {
            List {
                Section(header: HStack {
                    Text(session.name)
                }.font(.title3))
                {
                    HStack {
                        Text("UUID")
                        Spacer()
                        Text(session.id!)
                            .foregroundColor(Color.gray)
                            .frame(width: 200.0)
                    }
                    HStack {
                        Text("Session Name")
                        Spacer()
                        Text(session.name)
                    }
                    
                    HStack {
                        Text("Description")
                        Spacer()
                        Text(session.description)
                    }
                    
                    HStack {
                        Text("Date")
                        Spacer()
                        Text(session.date, style: .date)
                    }
                    
                    HStack {
                        Text("Location")
                        Spacer()
                        Text(session.location)
                    }
                    
                    HStack {
                        Text("Status")
                        Spacer()
                        Text(String(session.isRunning ? "Running" : "Not Running"))
                    }
                    
                    HStack {
                        NavigationLink(destination: CategoryCard(categories: session.categories)) {
                            Text("Category")
                        }
                    }
                }
            }
        }
    }
}

struct SessionCard_Previews: PreviewProvider {
    static var previews: some View {
        SessionCard(session: SessionRestaurant)
    }
}
