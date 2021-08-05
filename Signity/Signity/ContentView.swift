//
//  ContentView.swift
//  Signity
//
//  Created by charlie siagian on 02/08/21.
//

import SwiftUI

struct ContentView: View {
    @State var temp = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, Team \(Int.random(in: 0...2)) Lucu")
                    .padding()
                Button("Click me - \(temp)") {
                    temp += 1
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
