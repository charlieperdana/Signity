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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image("chevron.backward")
                }
            }
        }
    
    var body: some View {
        NavigationView {
            VStack  {
                Text("Selamat Pagi")
                    .font(.system(size: 17, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("DarkPurple"))
                
                LottieView(name: "person", playbackSpeed: viewModel.playbackSpeed)
                    //lottie name should be variable of content
                    .frame(minWidth: 0, maxWidth: 240, minHeight: 0, maxHeight: 320)
                    .background(Color.white)
                
                PlaybackButton(state: viewModel.playbackState) {
                    if viewModel.playbackState == .slow {
                        viewModel.playbackState = .normal
                    } else {
                        viewModel.playbackState = .slow
                    }
                }
                Spacer()
                VStack(alignment:.leading) {
                    Button(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.isPresentingPractice = true
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text("Mulai Latihan")
                                .fontWeight(.bold)
                                .font(.system(size: 17, design: .rounded))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("MainPurple"))
                        .cornerRadius(13)
                    }
                    
                    HStack {
                        Spacer()
                        Text("Bandingkan kalimat ini dengan BISINDO daerah lain")
                            .font(.system(size: 13, design: .rounded))
                            .fontWeight(.regular)
                            .foregroundColor(Color("DarkPurple"))
                        Spacer()
                    }
                    
                    Button(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.isPresentingCompareModal = true
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text("Bandingkan")
                                .fontWeight(.bold)
                                .font(.system(size: 17, design: .rounded))
                                .foregroundColor(Color("MainPurple"))
                            Spacer()
                        }
                        .padding()
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color("MainPurple")))
                    }
                }
                .padding(.vertical)
                .offset(y: 20)
                
                NavigationLink(destination: PracticeView(), isActive: $isPresentingPractice) {
                    EmptyView()
                }

                .sheet(isPresented: $isPresentingCompareModal, content: {
                    ComparePhraseView()
                })
                
            }
            .padding(.all)

            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .navigationBarTitle("Sapaan", displayMode: .inline)
            //navbar title name should be variable of category name
        }
    }
}

struct TutorialPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialPhraseView()
    }
}
