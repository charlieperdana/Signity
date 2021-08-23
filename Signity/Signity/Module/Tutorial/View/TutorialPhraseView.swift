//
//  TutorialPhraseView.swift
//  Signity
//
//  Created by Komang Aryadinata on 06/08/21.
//

import SwiftUI

struct TutorialPhraseView: View {
    @State var isPresentingPractice = false
    @State var isPresentingCompareModal = false
    @StateObject var viewModel = TutorialViewModel()

    @State var navBarHidden = false
    
    var category: Category
    var chosenCourse: Course
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack  {
            Text(chosenCourse.name)
                .modifier(SignityHeadlineThin(color: .text))
                .padding(.top)
            
            LottieView(name: chosenCourse.videoName, playbackSpeed: viewModel.playbackSpeed)
                //lottie name should be variable of content
                .frame(minWidth: 0, maxWidth: 240, minHeight: 0, maxHeight: 320)
                .background(Color.white)
                .cornerRadius(13)
            
            PlaybackButton(state: viewModel.playbackState) {
                if viewModel.playbackState == .slow {
                    viewModel.playbackState = .normal
                } else {
                    viewModel.playbackState = .slow
                }
            }
            Spacer()
            VStack(alignment: .center) {
                if category.typeEnum != .situation {
                    SignityButton(text: "Mulai Latihan") {
                        self.navBarHidden = true
                        self.isPresentingPractice = true
                    }
                }
                
                Text("Bandingkan kalimat ini dengan BISINDO daerah lain")
                    .modifier(SignityFootnote(color: .text))
                
                SignityButtonOutline(text: "Bandingkan") {
                    self.isPresentingCompareModal = true
                }
            }
            .padding(.vertical)
            .offset(y: 20)
            
            NavigationLink(destination: OnboardingLatihanTiru(category: category, chosenCourse: chosenCourse), isActive: $isPresentingPractice) {}

            .sheet(isPresented: $isPresentingCompareModal, content: {
                ComparePhraseView(chosenCourse: chosenCourse)
            })
        }
        .padding()

        .navigationBarTitle(category.name, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton {
            self.presentationMode.wrappedValue.dismiss()
        })
        .navigationBarHidden(self.navBarHidden)
        
        .onAppear {
            self.navBarHidden = false
        }
    }
}

//struct TutorialPhraseView_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialPhraseView(category: , chosenWord: <#String#>)
//    }
//}
