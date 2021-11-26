//
//  TapCate.swift
//  Tap Tracker
//
//  Created by Steven Kim on 2021-11-26.
//

import SwiftUI

struct TapCate: View {
    @State var category: Int = 1
    var body: some View {
        NavigationView {
            VStack {
                Text("How many categories?")
                
                TextField(
                    "Family Name",
                    value: $category, formatter: NumberFormatter()
                ).frame(width: 200, alignment: .center).padding().keyboardType(.numberPad)
                if (category > 0 && category < 5) {
                    NavigationLink(
                        destination: TapView(category: category)) {
                        Text("Submit")
                            .foregroundColor(Color.blue)
                    }
                }
            }.textFieldStyle(.roundedBorder)
        }.navigationBarBackButtonHidden(true)
    }
}

struct TapCate_Previews: PreviewProvider {
    static var previews: some View {
        TapCate()
    }
}
