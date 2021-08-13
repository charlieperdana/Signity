//
//  OnboardingSimulasi.swift
//  Signity
//
//  Created by Devina Ranlyca on 06/08/21.
//

import SwiftUI

struct OnboardingSimulasi: View {
    @State var showSimulation = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var category: Category
    
    var body: some View {
        VStack {
            BackButton {
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Text("Simulasi Pelajaran")
                .modifier(SignityTitle(color: .text))

            Image("IlustrasiSimulasi")
                .offset(y:30)
             
            Spacer()
            
            Text("Berlatih tanya jawab seperti percakapan langsung")
                .modifier(SignityHeadlineThin(color: .gray1))
                .padding(.horizontal,50)
                .offset(y:-60)
            
            Spacer()
            
            SignityButton(text: "Berikutnya") {
                self.showSimulation = true
            }
            
            NavigationLink(
                destination: SimulationView(category: category),
                isActive: $showSimulation) {}
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct OnboardingSimulasi_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSimulasi(category: Category())
    }
}
