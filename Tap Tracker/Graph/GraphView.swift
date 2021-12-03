//
//  GraphView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI
import Charts
import FirebaseFirestore
import FirebaseFirestoreSwift

// use foreach to fetch session taps / timestamp as x/y
var db = Firestore.firestore();
var sessionRef = db.collection("sessions")
var mySession = sessionRef.document("FBCC861B-D0DF-4440-A37F-9E99BE287FDA").collection("categories")

var catDocs = [String:String]()

var barEntries = [BarChartDataEntry]()
var lineEntries = [ChartDataEntry]()

func loadEntries() {
    mySession.getDocuments() { (docs, err) in
        if let documents = docs {
            documents.documents.forEach { doc in
                catDocs[doc.documentID] = doc.data()["title"] as? String;
            }
        } else {
            print("Document does not exist: \(String(describing: err))")
        }
    }
}

struct GraphView: View {
    
    @State private var isBarChart = true
    @State private var showActionSheet = false;
    @State private var selection = "None";
    
    var body: some View {
        loadEntries();
        
        return VStack {
            Text(selection)
            if #available(iOS 15.0, *) {
                Button("Choose category") {
                    showActionSheet = true;
                }.confirmationDialog("Select a category", isPresented: $showActionSheet, titleVisibility: .visible) {
                    ForEach(Array(catDocs.keys), id: \.self) { key in
                        Button(catDocs[key]!) {
                            barEntries.removeAll()
                            lineEntries.removeAll()
                            selection = catDocs[key]!
                            mySession.document(key).getDocument { (document, error) in
                                if let document = document, document.exists {
                                    let countDetails = document.get("count") as? [[String: Any]]
                                    countDetails!.forEach { count in
                                        barEntries.append(BarChartDataEntry(x: count["time"]! as! Double, y: count["value"]! as! Double))
                                        lineEntries.append(ChartDataEntry(x: count["time"]! as! Double, y: count["value"]! as! Double))
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                Text("Version too outdated please buy a better phone")
            }

            HStack {
                Button(action: {
                    isBarChart = false
                }, label: {
                   HStack {
                      Text("Line Chart")
                   }
                })
                .padding()
                Button(action: {
                    isBarChart = true
                }, label: {
                   HStack {
                      Text("Bar Chart")
                   }
                })
                .padding()
            }
            
            if (isBarChart) {
                BarChart(entries: barEntries)
            } else {
                LineChart(entries: lineEntries)
            }
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
