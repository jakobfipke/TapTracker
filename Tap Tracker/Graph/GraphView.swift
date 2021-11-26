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
var mySession = sessionRef.document("HtwlK4hfXWp31YsrGIRL").collection("categories")



var barEntries = [BarChartDataEntry(x: 1, y: 1),
                  BarChartDataEntry(x: 2, y: 1),
                  BarChartDataEntry(x: 3, y: 1),
                  BarChartDataEntry(x: 4, y: 1),
                  BarChartDataEntry(x: 5, y: 1)]

var lineEntries = [ChartDataEntry(x: 1, y: 1),
                   ChartDataEntry(x: 2, y: 2),
                   ChartDataEntry(x: 3, y: 3),
                   ChartDataEntry(x: 4, y: 4),
                   ChartDataEntry(x: 5, y: 5)]

func getStuff() {
    sessionRef.getDocuments() { (docs, err) in
        if let documents = docs {
            documents.documents.forEach { doc in
                print(doc.documentID)
            }
        } else {
            print("Document does not exist: \(String(describing: err))")
        }
    }
}

struct GraphView: View {
    
    @State private var isBarChart = true
    
    var body: some View {
        getStuff();
        
        return VStack {

            HStack {
                Button(action: {
                    isBarChart = false
                }, label: {
                   HStack {
//                      Image(systemName: "plus.circle.fill")
                      Text("Line Chart")
                   }
                })
                .padding()
                Button(action: {
                    isBarChart = true
                }, label: {
                   HStack {
//                      Image(systemName: "plus.circle.fill")
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
