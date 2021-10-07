//
//  ComparePhraseView.swift
//  Signity
//
//  Created by Komang Aryadinata on 06/08/21.
//

import SwiftUI

struct ComparePhraseView: View {
    @State var isPresentingCompareModal = true
    @StateObject var viewModel = TutorialViewModel()
    
    var chosenCourse: Course
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack  {
                Text(chosenCourse.name)
                    .modifier(SignityHeadlineThin(color: .text))
                
                HStack {
                    VStack {
                        LottieView(name: chosenCourse.videoName, playbackSpeed: viewModel.playbackSpeed)
                            //lottie name should be variable of content
                            .frame(minWidth: 0, maxWidth: 171, minHeight: 0, maxHeight: 320)
                            .background(Color.white)
                            .cornerRadius(13)
                        Text("Jakarta")
                            .modifier(SignityHeadline(color: .text))
                    }
                    VStack {
                        LottieView(name: chosenCourse.videoName, playbackSpeed: viewModel.playbackSpeed)
                            //lottie name should be variable of content
                            .frame(minWidth: 0, maxWidth: 171, minHeight: 0, maxHeight: 320)
                            .background(Color.white)
                            .cornerRadius(13)
                        Text("Denpasar")
                            .modifier(SignityHeadline(color: .text))
                    }
                }
                PlaybackButton(state: viewModel.playbackState) {
                    if viewModel.playbackState == .slow {
                        viewModel.playbackState = .normal
                    } else {
                        viewModel.playbackState = .slow
                    }
                }
            }
            .offset(y: -80)
            .padding(.all)
            
            .navigationBarTitle("Bandingkan", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color("NavigationItem"))
            }))
            //navbar title name should be variable of category name
        }
    }
}

struct ComparePhraseView_Previews: PreviewProvider {
    static var previews: some View {
        ComparePhraseView(chosenCourse: Course())
    }
}
