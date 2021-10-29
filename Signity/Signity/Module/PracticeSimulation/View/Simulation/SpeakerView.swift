//
//  TopSimulationView.swift
//  Signity
//
//  Created by Andrean Lay on 29/10/21.
//

import SwiftUI

struct SpeakerView: View {
    @ObservedObject var viewModel: SimulationViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            ChatBubble(text: viewModel.speakerCurrentWord)
            
            LottieView(name: viewModel.courses[viewModel.userPosition - 1].videoName, playbackSpeed: 1.0)
                .frame(width: 150, height: 200)
                .background(Color.white)
                .cornerRadius(25)
        }
        .padding()
    }
}
