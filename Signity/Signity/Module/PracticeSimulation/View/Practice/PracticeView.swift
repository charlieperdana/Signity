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
    
    @State var isNavBarHidden = false
    @State var isGuidePassed = false
    
    var category: Category
    
    init(category: Category, chosenCourse: Course) {
        _viewModel = StateObject(wrappedValue: PracticeViewModel(category: category, chosenCourse: chosenCourse))
        
        self.category = category
    }

    var body: some View {
        ZStack {
            CameraRepresentable(addToLandmarkQueue: { arr in
                viewModel.addLandmarks(landmark: arr)
            }) { hands, highConfidenceLandmarks in
                viewModel.detectedHands = hands

                if !isGuidePassed {
                    isGuidePassed = (highConfidenceLandmarks == 42)
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
                    self.isNavBarHidden.toggle()
                }
            }
            
            if !isNavBarHidden {
                CameraNavigationBar(title: "Latihan Tiru",
                                    leftAction: {
                                        mode.wrappedValue.dismiss()
                                    }, rightAction: {
                                        viewModel.practiceDone = true
                                    })
                
                NavigationLink(destination: AccomplishmentTiru(category: category), isActive: $viewModel.practiceDone) {
                    EmptyView()
                }
            }
            
            if !isGuidePassed {
                HandGuide()
            } else {
                VStack {
                    HStack(alignment: .top) {
                        ChatBubble(text: viewModel.chosenCourse.name)
                            .offset(y: -15)
                        
                        VideoView(videoName: viewModel.chosenCourse.videoName)
                            .frame(width: 150, height: 200)
                    }
                    .padding()
                    Spacer()
                    HorizontalModules(category: self.category, currentSelected: $viewModel.chosenCourse, currentIndex: viewModel.currentIndex)
                }
                .padding(.top, self.isNavBarHidden ? 45 : 85)
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        
        .onAppear {
            TimeoutManager.shared.disableDimming()
        }
        .onDisappear {
            TimeoutManager.shared.enableDimming()
        }
    }
}

//struct PracticeView_Previews: PreviewProvider {
//    static var previews: some View {
//        PracticeView()
//    }
//}
