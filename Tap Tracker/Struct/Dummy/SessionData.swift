//
//  SessionData.swift
//  Tap Tracker
//
//  Created by Dohun Kim on 2021-10-08.
//

import Foundation
import GoogleSignIn

let sessions = [
    SessionRestaurant,
    SessionArena
]

let SessionRestaurant = Session(userId: GIDSignIn.sharedInstance.currentUser?.userID ?? "test", name: "Restaurant", description: "ResDesc", date: Date(), location: "Vancouver", isRunning: false, categories: CateArrRestaurant)

let SessionArena = Session(userId: GIDSignIn.sharedInstance.currentUser?.userID ?? "test", name: "Arena", description: "Arena Desc", date: Date(), location: "Vancouver", isRunning: true, categories: CateArrArena)

let NewSession = Session(userId: GIDSignIn.sharedInstance.currentUser?.userID ?? "no", name: "New Session", description: "", date: Date(), location: "", isRunning: false, categories: [Category]())
