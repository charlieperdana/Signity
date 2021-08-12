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
    var chosenWord: String
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack  {
            Text(chosenWord)
                .font(.system(size: 17, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(Color("DarkPurple"))
                .padding(.top)
            
            LottieView(name: "terimaKasihJKT", playbackSpeed: viewModel.playbackSpeed)
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
            VStack(alignment:.leading) {
                SignityButton(text: "Mulai Latihan") {
                    self.navBarHidden = true
                    self.isPresentingPractice = true
                }
                
                HStack {
                    Spacer()
                    Text("Bandingkan kalimat ini dengan BISINDO daerah lain")
                        .font(.system(size: 13, design: .rounded))
                        .fontWeight(.regular)
                        .foregroundColor(Color("DarkPurple"))
                    Spacer()
                }
                
                SignityButtonOutline(text: "Bandingkan") {
                    self.isPresentingCompareModal = true
                }
            }
            .padding(.vertical)
            .offset(y: 20)
            
            NavigationLink(destination: OnboardingLatihanTiru(category: category, chosenWord: chosenWord), isActive: $isPresentingPractice) {}

            .sheet(isPresented: $isPresentingCompareModal, content: {
                ComparePhraseView(chosenWord: chosenWord)
            })
        }
        .padding()

        .navigationBarTitle(category.name ?? "Not found", displayMode: .inline)
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
