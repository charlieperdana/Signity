//
//  OnboardingLatihanTiru.swift
//  Signity
//
//  Created by Devina Ranlyca on 05/08/21.
//

import SwiftUI

struct OnboardingLatihanTiru: View {
    var category: Category
    var chosenWord: String

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
            
            SignityButton(text: "Berikutnya") {
                self.showPractice = true
            }
            
            NavigationLink(destination: PracticeView(category: category, chosenWord: chosenWord), isActive: $showPractice) {
                EmptyView()
            }
        }
        .padding()
        .navigationBarHidden(true)
    }
}


struct OnboardingLatihanTiru_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLatihanTiru(category: Category(), chosenWord: "")
    }
}
