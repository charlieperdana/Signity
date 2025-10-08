//
//  Onboarding.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject var router: ViewRouter
    @StateObject var viewModel = OnboardingViewModel()
    @State var showNextOnboard = false
    @State var showCourse = false
    
    var body: some View {
        VStack(alignment: .center)  {
            Spacer()
            
            Text("Selamat Datang!")
                .modifier(SignitySubtitle(color: .text))
            
            Image("onboarding1")
            
            Text("Apakah kamu pernah belajar BISINDO sebelumnya?")
                .modifier(SignityBody(color: .text))
                .offset(y: 10)
            
            VStack(alignment:.leading, spacing: 15) {
                SignityButton(text: "Belum, saya masih pemula!") {
                    viewModel.completeOnboardingSetup(newPractitioner: true)
                    router.currentPage = .course
                }
                SignityButtonOutline(text: "Pernah, saya mengerti BISINDO.") {
                    self.showNextOnboard = true
                }
            }
            .padding(.vertical)
            .offset(y: 20)
            
            Spacer()
            
            //MARK: - NAVIGATION LINKS
            NavigationLink(destination: OnboardingRegion(viewModel: viewModel).environmentObject(router), isActive: $showNextOnboard) {}
        }
        .padding(.all)
        .padding(.bottom, 150)
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        
        .onAppear {
            self.showCourse = UserDefaults.standard.didCompleteSetup
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
