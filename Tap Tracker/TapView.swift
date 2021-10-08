//
//  TapView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI

struct TapView: View {
    var body: some View {
        Group {
            VStack {
                HStack {
                    TapPane(
                        count: 0,
                        color: .blue
                    )
                    TapPane(
                        count: 0,
                        color: .green
                    )
                }
                HStack {
                    TapPane(
                        count: 0,
                        color: .yellow
                    )
                    TapPane(
                        count: 0,
                        color: .red
                    )
                }
            }.padding(8)
        }
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}
