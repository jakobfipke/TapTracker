//
//  CategoryRepository.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-29.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

class CategoryRepository: ObservableObject {
   let db = Firestore.firestore()
   
   @Published var categories = [Category]()
   
   init() {
      loadData()
   }
   
   func loadData() {
       if self.categories.count == 0 {
           self.categories.append(Category(CategoryTitle: "", Count: 0))
       }
//        let currentUserId = Auth.auth().currentUser?.uid
//
//
//        db.collection("tasks")
//           .whereField("userId", isEqualTo: currentUserId ?? "")
//            .order(by: "createdTime")
//            .addSnapshotListener {(querySnapshot, error) in
//                if let querySnapshot = querySnapshot {
//                    self.tasks = querySnapshot.documents.compactMap { document in
//                        do {
//                            let x = try document.data(as: Task.self)
//                            return x
//                        } catch {
//                            print(error)
//                        }
//                        return nil
//                    }
//                }
//            }
   }
   
   func addCtg(_ ctg: Category) {
       self.categories.append(ctg)
   }
   
   func updateCtg(_ ctg: Category) {
   }
    
    func deleteCtg(_ ctg: Category) {
       if let ID = ctg.id {
       }
    }
}
