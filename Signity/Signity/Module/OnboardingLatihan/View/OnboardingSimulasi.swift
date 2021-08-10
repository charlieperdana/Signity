//
//  OnboardingSimulasi.swift
//  Signity
//
//  Created by Devina Ranlyca on 06/08/21.
//

import SwiftUI

struct OnboardingSimulasi: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image("backBtn")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)

            }
        }
    }
    
    var category: Category
    
    var body: some View {
        NavigationView{
        VStack {
            
            Text("Simulasi Pelajaran")
                .font(.system(size: 32, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color("MainPurple"))

                

            
            Image("IlustrasiSimulasi")
                .offset(y:30)
            
            
            Spacer()
            
            Text("Berlatih tanya jawab seperti percakapan langsung")
                .font(.system(size:17, design:.rounded))
                .fontWeight(.semibold)
                .foregroundColor(Color("MainPurple"))
                .multilineTextAlignment(.center)
                .padding(.horizontal,50)
                .offset(y:-60)
            
            Spacer()
            
            NavigationLink(
                destination: SimulationView(category: category),
                
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        }
    }
}
struct OnboardingSimulasi_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSimulasi(category: Category())
    }
}
