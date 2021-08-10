//
//  PracticeView.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct PracticeView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var viewModel: PracticeViewModel
    @State var value: Double = 0.5
    
    @State var navBarHidden = false
    @State var guidePassed = false
    
    var category: Category
    
    init(category: Category, chosenWord: String) {
        _viewModel = StateObject(wrappedValue: PracticeViewModel(category: category, chosenWord: chosenWord))
        
        self.category = category
    }

    var body: some View {
        ZStack {
            CameraRepresentable(addToLandmarkQueue: { arr in
                viewModel.addLandmarks(landmark: arr)
            }) { hands, highConfidenceLandmarks in
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
            
            if !navBarHidden {
                CameraNavigationBar(title: "Latihan Tiru",
                                    leftAction: {
                                        mode.wrappedValue.dismiss()
                                    }, rightAction: {
                                        viewModel.practiceDone = true
                                    })
                
                NavigationLink(destination: OnboardingSimulasi(category: category), isActive: $viewModel.practiceDone) {
                    EmptyView()
                }
            }
            
            if !guidePassed {
                HandGuide()
            } else {
                VStack {
                    HStack(alignment: .top) {
                        ChatBubble(text: viewModel.chosenWord)
                        
                        VideoView(videoName: .constant("Halo, selamat siang"), playbackSpeed: $viewModel.playbackSpeed, playbackState: $viewModel.playbackState)
                            .frame(width: 175, height: 225)
                    }
                    .padding()
                    Spacer()
                    HorizontalModules(category: self.category, currentSelected: $viewModel.chosenWord)
                }
                .padding(.top, self.navBarHidden ? 35 : 75)
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)

    }
}

//struct PracticeView_Previews: PreviewProvider {
//    static var previews: some View {
//        PracticeView()
//    }
//}
