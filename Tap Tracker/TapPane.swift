//
//  TapPane.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI

struct TapPane: View {
    var color: Color
    var body: some View {
        ZStack {
//            VStack {
//                Spacer()
//                    .onTapGesture {
//                        print("hello")
//                    }
//                Divider()
//                Spacer()
//                    .onTapGesture {
//                        print("hello")
//                    }
//            }
            VStack {
                TextField("Category", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding(5)
                    .foregroundColor(color)

                Spacer()
                Text(String(count))
                    .padding()
                    .foregroundColor(color)
                    .font(.largeTitle)

                Spacer()
            }
        }
        
        
    }
    var count: Int
}

struct TapPane_Previews: PreviewProvider {
    static var previews: some View {
        TapPane(color: .red, count: 0)
    }
}
