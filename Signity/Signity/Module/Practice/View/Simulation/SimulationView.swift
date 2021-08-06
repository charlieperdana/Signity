//
//  SimulationView.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct SimulationView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var viewModel = SimulationViewModel()
    @State var navBarHidden = false
    
    var body: some View {
        NavigationView {
            ZStack {
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
                
                if !navBarHidden {
                    CameraNavigationBar(title: "Latihan Simulasi",
                                        leftAction: {
                                            mode.wrappedValue.dismiss()
                                        }, rightAction: {
                                            viewModel.simulationDone = true
                                        })
                    
                    NavigationLink(destination: EmptyView(), isActive: $viewModel.simulationDone) {
                        EmptyView()
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
            .navigationBarHidden(true)
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
