//
//  Category.swift
//  Tap Tracker
//
//  Created by Dohun Kim on 2021-10-08.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Category: Codable, Identifiable {
    @DocumentID var id: String? = UUID().uuidString
    var CategoryTitle: String
    var Count: Int
}
