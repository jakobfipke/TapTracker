//
//  Session.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import Foundation

struct Session {
    let id = UUID()
    var name: String
    var description: String
    var date: Date
    var location: String
    var isRunning: Bool
    var categories: Array<String>
}
