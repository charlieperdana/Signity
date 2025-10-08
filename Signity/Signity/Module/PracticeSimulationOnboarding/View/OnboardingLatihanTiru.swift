//
//  OnboardingLatihanTiru.swift
//  Signity
//
//  Created by Devina Ranlyca on 05/08/21.
//

import SwiftUI

struct OnboardingLatihanTiru: View {
    @StateObject var viewModel = PracticeOnboardingViewModel()
    var category: Category
    var chosenCourse: Course

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var showPractice = false
    
    var body: some View {
        VStack {
            BackButton {
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Text("Latihan Tiru")
                .modifier(SignityTitle(color: .text))

            Image("Ilustrasi Tiru")
                .offset(y:30)
            
            Spacer()
            
            Text("Latihan kalimat BISINDO dengan menirukan video peragaan")
                .modifier(SignityHeadlineThin(color: .text))
                .padding(.horizontal, 50)
                .offset(y: -52)
            
            Spacer()
            
            if viewModel.cameraAuthorizationStatus != .authorized {
                SignityButton(text: "Allow camera access") {
                    viewModel.requestCameraAccess()
                }
            } else {
                SignityButton(text: "Berikutnya") {
                    self.showPractice = true
                }
            }
            
            NavigationLink(destination: PracticeView(category: category, chosenCourse: chosenCourse), isActive: $showPractice) {}
        }
        .padding()
        
        .navigationBarHidden(true)
    }
}


struct OnboardingLatihanTiru_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLatihanTiru(category: Category(), chosenCourse: Course())
    }
}
