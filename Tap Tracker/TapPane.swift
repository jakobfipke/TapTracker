//
//  TapPane.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-08.
//

import SwiftUI

struct TapPane: View {
    @State var count: Int
    var color: Color
    var body: some View {
        VStack {
            TextField("Category", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .padding(5)
                .foregroundColor(color)
            ZStack {
                VStack {
                    Text(String(count))
                        .padding()
                        .foregroundColor(color)
                        .font(.largeTitle)
                }
                VStack {
                    VStack {}
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        count += 1
                    }
                    VStack {}
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if count > 0 {
                            count -= 1
                        }
                    }
                }
            }
            
            
        }
    }
}

struct TapPane_Previews: PreviewProvider {
    static var previews: some View {
        TapPane(count: 0, color: .red)
    }
}
