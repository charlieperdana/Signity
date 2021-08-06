//
//  PracticeView.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct PracticeView: View {
    @StateObject var viewModel = PracticeViewModel()
    @State var value: Double = 0.5
    
    @State var navBarHidden = false
    @State var guidePassed = false
    
    var body: some View {
        CustomNavigation(navBarCollapsed: navBarHidden, destination: SimulationView(), isRoot: true, isLast: false, title: "Latihan Tiru") {
            Group {
                CameraRepresentable() { hands, highConfidenceLandmarks in
                    viewModel.detectedHands = hands
                    
                    if !guidePassed {
                        guidePassed = (highConfidenceLandmarks == 42)
                    }
                }
                .overlay(
                    ZStack {
                        HandLines(for: viewModel.detectedHands)
                            .stroke(Color.green, lineWidth: 2)
                        HandLandmarks(for: viewModel.detectedHands)
                            .fill(Color.green)
                    }
                )
                .onTapGesture {
                    withAnimation {
                        self.navBarHidden.toggle()
                    }
                }
                
                if !guidePassed {
                    HandGuide()
                } else {
                    VStack {
                        HStack(alignment: .top) {
                            ChatBubble(text: "Selamat pagi")
                            
                            VideoView(videoName: $viewModel.currentVideo, playbackSpeed: $viewModel.playbackSpeed, playbackState: $viewModel.playbackState)
                        }
                        .padding()
                        Spacer()
                        HorizontalModules(viewModel: viewModel)
                    }
                    .padding(.top, self.navBarHidden ? 35 : 75)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
