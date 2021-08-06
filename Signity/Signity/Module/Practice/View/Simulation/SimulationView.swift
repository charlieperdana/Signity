//
//  SimulationView.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct SimulationView: View {
    @StateObject var viewModel = SimulationViewModel()
    @State var navBarHidden = false
    
    var body: some View {
        CustomNavigation(navBarCollapsed: navBarHidden, destination: Onboarding(), isRoot: false, isLast: false, title: "Latihan Simulasi") {
            Group {
                CameraRepresentable() { hands, _ in
                    viewModel.detectedHands = hands
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

                VStack {
                    ProgressBar(value: .constant(0.5))
                    
                    HStack(alignment: .top) {
                        ChatBubble(text: "Selamat pagi")
                        
                        LottieView(name: "blender", playbackSpeed: 1.0)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                            .background(Color.white)
                            .cornerRadius(25)
                    }
                    .padding()
                    
                    Spacer()
                    
                    HStack {
                        YourTurnView()
                        Spacer()
                        HintButton()
                    }
                    .padding(.horizontal)
                    
                    SentenceFeedbackView()
                        .padding(.bottom, 40)
                }
                .padding(.top, self.navBarHidden ? 35 : 75)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        
    }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView()
            .preferredColorScheme(.dark)
    }
}
