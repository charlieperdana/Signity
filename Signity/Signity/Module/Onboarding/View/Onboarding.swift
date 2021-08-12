//
//  Onboarding.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct Onboarding: View {
    @StateObject var viewModel = OnboardingViewModel()
    @State var showNextOnboard = false
    @State var showCourse = false

    let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center)  {
                Spacer()
                
                Text("Selamat Datang!")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))
                
                
                Image("onboarding1")
                
                Text("Apakah kamu pernah belajar BISINDO sebelumnya?")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .offset(y: 10)
                
                VStack(alignment:.leading, spacing: 15) {
                    
                    SignityButton(text: "Belum, saya masih pemula") {
                        viewModel.completeOnboardingSetup()
                        self.showCourse = true
                    }
                    
                    SignityButtonOutline(text: "Pernah, saya mengerti BISINDO") {
                        self.showNextOnboard = true
                    }
                }
                .padding(.vertical)
                .offset(y: 20)
                
                Spacer()
                
                //MARK: - NAVIGATION LINKS
                NavigationLink(destination: OnboardingRegion(viewModel: viewModel), isActive: $showNextOnboard) {}
                NavigationLink(destination: CoursePage(), isActive: $showCourse) {
                    EmptyView()
                }
            }
            .padding(.all)
            .padding(.bottom, 150)
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        
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
