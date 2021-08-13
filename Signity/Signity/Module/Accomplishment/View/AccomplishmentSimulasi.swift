//
//  AccomplishmentSimulasi.swift
//  Signity
//
//  Created by Devina Ranlyca on 06/08/21.
//

import SwiftUI

struct AccomplishmentSimulasi: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var showCoursePage = false
    
    var body: some View {
        ZStack{
            Color("MainPurple")
                .ignoresSafeArea(.all)
            
            VStack{
                BackButton(color: .white) {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding()
                
                Text("Simulasi Selesai!")
                    .modifier(SignityTitle(color: .white))
                
                Spacer()
                
                Image("LatihanSimulasi_Badge")
                    .offset(y:78)
                
                Spacer()
                
                
                Image("bottomCircle")
                    .offset(y: 200)
                
                
                Spacer()
                
                
                SignityButton(text: "Kembali ke pelajaran") {
                    NavigationUtil.popToRootView()
                }
                .padding()
                
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}


struct AccomplishmentSimulasi_Previews: PreviewProvider {
    static var previews: some View {
        AccomplishmentSimulasi()
    }
}
