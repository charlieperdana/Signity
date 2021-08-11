//
//  ContentView.swift
//  Signity
//
//  Created by charlie siagian on 02/08/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    var availableRegions = ["Jakarta", "Denpasar", "Lainnya"]
    @Published var currentChosen: RegionType = .jakarta
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
