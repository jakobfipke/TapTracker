//
//  Session.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Session: Codable, Identifiable {
    @DocumentID var id: String? = UUID().uuidString
    var name: String
    var description: String
    var date: Date
    var location: String
    var isRunning: Bool
    var categories: Array<Category>
    @ServerTimestamp var createdTime: Timestamp?
}

