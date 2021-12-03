//
//  TapView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI



struct TapView: View {
    var body: some View {
        VStack {
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
//            HStack {
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                    Image(systemName: "square.and.arrow.up")
//                        .font(.system(size: 34, weight: .regular))
//                }.padding()
//                Spacer()
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                    HStack {
//                        Image(systemName: running ? "pause.fill" : "play.fill")
//                            .font(.system(size: 16, weight: .regular))
//                        Text(running ? "Pause" : "Resume")
//
//                    }.padding()
//                }.overlay(
//                    RoundedRectangle(cornerRadius: 2)
//                        .stroke(Color.blue, lineWidth: 1)
//                )
//                Spacer()
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                    Image(systemName: "arrow.counterclockwise.circle.fill")
//                        .font(.system(size: 38, weight: .regular))
//                }.padding()
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                    Image(systemName: "pencil.circle")
//                        .font(.system(size: 38, weight: .regular))
//                }.padding()
//            }
        }
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}
