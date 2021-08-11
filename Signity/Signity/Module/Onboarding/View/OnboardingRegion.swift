//
//  OnboardingRegion.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct OnboardingRegion: View {
    @StateObject var viewModel = OnboardingViewModel()
    @State var showCourse = false
    
    var body: some View {
        VStack {
            BackButton()
            
            GeometryReader { geo in
                VStack {
                    Text("BISINDO daerah mana yang kamu gunakan?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("DarkPurple"))
                        .multilineTextAlignment(.center)
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Image("onboarding2")
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            
            
            Spacer()

            VStack {
                ForEach(viewModel.availableRegion, id: \.self) { region in
                    RegionSelectionButton(currentRegion: $viewModel.selectedRegion, regionName: region) {
                        viewModel.selectedRegion = region
                    }
                }
                Spacer()
                SignityButton(text: "Selesai") {
                    viewModel.completeOnboardingSetup()
                    self.showCourse = true
                }
            }
            //MARK: - NAVIGATION LINKS
            NavigationLink(destination: CoursePage(), isActive: $showCourse) {}
            
            .navigationBarHidden(true)
        }
        .padding(.all)
    }
}

struct OnboardingRegion_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingRegion()
    }
}
