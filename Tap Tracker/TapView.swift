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
                    Group {
                        TapPane(
                            color: .blue,
                            count: 0
                        )
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    Group {
                        TapPane(
                            color: .green,
                            count: 5
                        )
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                HStack {
                    Group {
                        TapPane(                            color: .yellow,
                            count: 8
                        )
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    Group {
                        TapPane(
                            color: .red,
                            count: 3
                        )
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}
