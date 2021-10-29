//
//  SessionRepository.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-29.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class SessionRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var sessions = [Session]()
    
    init() {
        
    }
    
    func addSession(_ session: Session) {
        do {
            let _ = try db.collection("sessions").addDocument(from: session)
        } catch {
            fatalError("Unable to encode session: \(error.localizedDescription)")
        }
    }
    
    func updateSession(_ session: Session) {
        if let sessionId = session.id {
            do {
                let _ = try db.collection("sessions").document(sessionId).setData(from: session)
            } catch {
                fatalError("Unable to encode session: \(error.localizedDescription)")
            }
        }
    }
}
