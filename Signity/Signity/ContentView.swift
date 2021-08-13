//
//  ContentView.swift
//  Signity
//
//  Created by charlie siagian on 02/08/21.
//

import SwiftUI

struct ContentView: View {
    
    var items: [GridItem] = Array(repeating: .init(.flexible(minimum: 0, maximum: .infinity)), count: 5)
    
    var body: some View {
        LazyVGrid(columns: items, alignment: .center) {
            ForEach(0..<5) {i in
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(Color("MainPurple"))
                    Text(String(i))
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
