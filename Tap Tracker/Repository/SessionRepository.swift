//
//  SessionRepository.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-29.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import GoogleSignIn

class SessionRepository: ObservableObject {
    private var user: GIDGoogleUser? {
      return GIDSignIn.sharedInstance.currentUser
    }
    let db = Firestore.firestore()
    
    @Published var sessions = [Session]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let ID = user?.userID {
            db.collection("sessions")
                .whereField("userId", isEqualTo: ID)
                .addSnapshotListener {(querySnapshot, error) in
                    if let querySnapshot = querySnapshot {
                        self.sessions = querySnapshot.documents.compactMap { document in
                            do {
                                let x = try document.data(as: Session.self)
                                return x
                            } catch {
                                print(error)
                            }
                            return nil
                        }
                    }
                }
        }
    }
    
    
    func addSession(_ session: Session) {
        do {
            let _ = try db.collection("sessions").document(session.id!).setData(from: session)
//            let _ = try db.collection("sessions").addDocument(from: session)
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
    
    func deleteSession(_ session: Session) {
        if let ID = session.id {
            db.collection("sessions").document(ID).delete() { err in
                if let err = err {
                    fatalError("Unable to delete task: \(err.localizedDescription)")
                }
            }
        }
    }
}
