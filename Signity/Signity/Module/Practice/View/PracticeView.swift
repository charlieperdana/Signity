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
    
    var body: some View {
        ZStack {
            CameraView() { hands in
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
            
            if !self.navBarHidden {
                CameraNavigationBar()
            }
            
            VStack {
                HStack(alignment: .top) {
                    ChatBubble() {
                        Text("Selamat pagi")
                            .padding(.all, 15)
                            .padding(.trailing, 10)
                            .background(Color.white)
                            .opacity(0.85)
                            .modifier(PhraseStyle())
                            .multilineTextAlignment(.leading)
                    }
                    
                    VStack(alignment: .trailing) {
                        LottieView(name: "arya", playbackSpeed: viewModel.playbackSpeed)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                            .background(Color.white)

                        PlaybackButton(state: viewModel.playbackState) {
                            if viewModel.playbackState == .slow {
                                viewModel.playbackState = .normal
                            } else {
                                viewModel.playbackState = .slow
                            }
                        }
                    }
                }
                .padding()
                Spacer()
                HorizontalModules(viewModel: viewModel)
            }
            .padding(.top, self.navBarHidden ? 35 : 75)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
