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
                            count: 0,
                            color: .blue
                        )
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    Group {
                        TapPane(
                            count: 0,
                            color: .green
                        )
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                HStack {
                    Group {
                        TapPane(
                            count: 0,
                            color: .yellow
                        )
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    Group {
                        TapPane(
                            count: 0,
                            color: .red
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
