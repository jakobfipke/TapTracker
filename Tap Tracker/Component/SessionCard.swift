//
//  SessionCard.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI

struct SessionCard: View {
    @State var session: Session
    var body: some View {
        Text(session.name)
    }
}

struct SessionCard_Previews: PreviewProvider {
    static var previews: some View {
        SessionCard(session: SessionRestaurant)
    }
}
