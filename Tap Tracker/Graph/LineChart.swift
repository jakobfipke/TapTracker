//
//  LineChart.swift
//  Tap Tracker
//
//  Created by Jonathan Orfani on 2021-11-12.
//

import Charts
import SwiftUI

struct LineChart: UIViewRepresentable {
    
    var entries: [ChartDataEntry]
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.data = addData()
        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> LineChartData{
        let data = LineChartData()
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.green]
        dataSet.label = "My Data"
        data.addDataSet(dataSet)
        return data
    }
    
    typealias UIViewType = LineChartView
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(entries: [
            ChartDataEntry(x: 0, y: 0),
            ChartDataEntry(x: 1, y: 1),
            ChartDataEntry(x: 2, y: 2),
            ChartDataEntry(x: 3, y: 3),
            ChartDataEntry(x: 4, y: 4)
        ])
    }
}
