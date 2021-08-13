//
//  OnboardingRegion.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct OnboardingRegion: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @State var showCourse = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var router: ViewRouter
    
    var body: some View {
        VStack {
            BackButton {
                self.presentationMode.wrappedValue.dismiss()
            }
            
            GeometryReader { geo in
                VStack {
                    Text("BISINDO daerah mana yang kamu gunakan?")
                        .modifier(SignitySubtitle(color: .text))
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
                    router.currentPage = .course
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
        OnboardingRegion(viewModel: OnboardingViewModel())
    }
}
