//
//  AccomplishmentTiru.swift
//  Signity
//
//  Created by Devina Ranlyca on 06/08/21.
//

import SwiftUI

struct AccomplishmentTiru: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var showSimulation = false
    
    var category: Category
    
    var body: some View {
        ZStack {
            Color("MainPurple")
                .ignoresSafeArea(.all)
            
            VStack{
                BackButton(color: .white) {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding()
                
                Text("Latihan Tiru Selesai!")
                    .modifier(SignityTitle(color: .white))
                
                Spacer()
                
                Image("LatihanTiru_Badge")
                    .offset(y:70)
                
                Spacer()
                
                Image("bottomCircle")
                    .offset(y: 200)
                
                Spacer()
                
                SignityButton(text: "Mulai Latihan Simulasi") {
                    self.showSimulation = true
                }
                .padding()
                
                NavigationLink(destination: OnboardingSimulasi(category: category), isActive: $showSimulation) {
                    EmptyView()
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct AccomplishmentTiru_Previews: PreviewProvider {
    static var previews: some View {
        AccomplishmentTiru(category: Category())
    }
}
