//
//  GraphView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI
import Charts

struct GraphView: View {
    var body: some View {
        BarChart(entries: [
            //x - position of a bar, y - height of a bar
            BarChartDataEntry(x: 1, y: 1),
            BarChartDataEntry(x: 2, y: 1),
            BarChartDataEntry(x: 3, y: 1),
            BarChartDataEntry(x: 4, y: 1),
            BarChartDataEntry(x: 5, y: 1)
        ])
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
