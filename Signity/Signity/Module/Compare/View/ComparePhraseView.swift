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
    
    var xmarkButton : some View { Button(action: {
        self.isPresentingCompareModal = false
        }) {
            HStack {
            Image("xmark")
            }
        }
    }
    
    var chosenWord: String
    
    var body: some View {
        NavigationView {
            VStack  {
                Text(chosenWord)
                    .modifier(SignityHeadlineThin(color: .darkPurple))
                
                HStack {
                    VStack {
                        LottieView(name: "terimaKasihJKT", playbackSpeed: viewModel.playbackSpeed)
                            //lottie name should be variable of content
                            .frame(minWidth: 0, maxWidth: 171, minHeight: 0, maxHeight: 320)
                            .background(Color.white)
                        Text("Jakarta")
                            .modifier(SignityHeadline(color: .darkPurple))
                    }
                    VStack {
                        LottieView(name: "terimaKasihDPS", playbackSpeed: viewModel.playbackSpeed)
                            //lottie name should be variable of content
                            .frame(minWidth: 0, maxWidth: 171, minHeight: 0, maxHeight: 320)
                            .background(Color.white)
                        Text("Denpasar")
                            .modifier(SignityHeadline(color: .darkPurple))
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
            .navigationBarItems(trailing: xmarkButton)
            //navbar title name should be variable of category name
        }
    }
}

struct ComparePhraseView_Previews: PreviewProvider {
    static var previews: some View {
        ComparePhraseView(chosenWord: "")
    }
}
