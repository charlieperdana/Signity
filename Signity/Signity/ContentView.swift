//
//  ContentView.swift
//  Signity
//
//  Created by charlie siagian on 02/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, Team 11 Lucu")
                    .padding()
                NavigationLink(destination: PracticeView()) {
                    Text("To Camera")
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarHidden(true)
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
