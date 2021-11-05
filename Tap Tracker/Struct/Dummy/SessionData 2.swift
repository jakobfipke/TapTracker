//
//  SessionData.swift
//  Tap Tracker
//
//  Created by Dohun Kim on 2021-10-08.
//

import Foundation

let sessions = [
    SessionRestaurant,
    SessionArena
]

let SessionRestaurant = Session(name: "Restaurant", description: "ResDesc", date: Date(), location: "Vancouver", isRunning: false, categories: CateArrRestaurant)

let SessionArena = Session(name: "Arena", description: "Arena Desc", date: Date(), location: "Vancouver", isRunning: true, categories: CateArrArena)
