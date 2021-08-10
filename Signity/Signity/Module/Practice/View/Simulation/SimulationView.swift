//
//  SimulationView.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct SimulationView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var viewModel: SimulationViewModel
    
    init(category: Category) {
        _viewModel = StateObject(wrappedValue: SimulationViewModel(category: category))
    }
    
    var body: some View {
//        NavigationView {
            ZStack {
                CameraRepresentable(addToLandmarkQueue: { arr in
                    viewModel.addToActionsList(landmark: arr)
                }) { hands, _ in
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
                        self.viewModel.navBarHidden.toggle()
                    }
                }
                
                if !viewModel.navBarHidden {
                    CameraNavigationBar(title: "Latihan Simulasi",
                                        leftAction: {
                                            mode.wrappedValue.dismiss()
                                        }, rightAction: {
                                            viewModel.simulationDone = true
                                        })
                    
                    NavigationLink(destination: AccomplishmentSimulasi(), isActive: $viewModel.simulationDone) {
                        EmptyView()
                    }
                }

                VStack {
                    ProgressBar(value: .constant(0.5))
                    
                    HStack(alignment: .top) {
                        ChatBubble(text: viewModel.speakerCurrentWord)
                        
                        LottieView(name: viewModel.speakerCurrentWord, playbackSpeed: 1.0)
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
                    
                    SentenceFeedbackView(words: $viewModel.wordTracking, currentCorrect: $viewModel.correctWord)
                        .padding(.bottom, 40)
                }
                .padding(.top, self.viewModel.navBarHidden ? 35 : 75)
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        
//    }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView(category: Category())
            .preferredColorScheme(.dark)
    }
}
