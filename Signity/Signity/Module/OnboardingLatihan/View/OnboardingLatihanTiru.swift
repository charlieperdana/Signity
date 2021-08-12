//
//  OnboardingLatihanTiru.swift
//  Signity
//
//  Created by Devina Ranlyca on 05/08/21.
//

import SwiftUI

struct OnboardingLatihanTiru: View {
    @EnvironmentObject var navManager: NavigationManager
    
    var category: Category
    var chosenWord: String

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var navBarHidden = false
    
    var body: some View {
        VStack {
            BackButton {
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Text("Latihan Tiru")
                .font(.system(size: 32, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color("MainPurple"))

                

            
            Image("Ilustrasi Tiru")
                .offset(y:30)
            
            
            Spacer()
            
            Text("Latihan kalimat BISINDO dengan menirukan video peragaan")
                .font(.system(size:17, design:.rounded))
                .fontWeight(.semibold)
                .foregroundColor(Color("MainPurple"))
                .multilineTextAlignment(.center)
                .padding(.horizontal,50)
                .offset(y:-52)
            
            Spacer()
            
            NavigationLink(
                destination: PracticeView(category: category, chosenWord: chosenWord),
                
            label: {
                Text("Berikutnya")
                .foregroundColor(.white)
                .font(.system(size:22, design:.rounded))
                .fontWeight(.bold)
                .frame(width: 358, height: 50)
                    .background(Color("MainPurple"))
                .cornerRadius(13)
            })
            
        }
        .padding()
    
        .navigationBarHidden(self.navBarHidden)
        
        .onTapGesture {
            self.navBarHidden = true
            print("Onboarding practice appearing..")
        }
    }
}


struct OnboardingLatihanTiru_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLatihanTiru(category: Category(), chosenWord: "")
    }
}
