//
//  AccomplishmentSimulasi.swift
//  Signity
//
//  Created by Devina Ranlyca on 06/08/21.
//

import SwiftUI

struct AccomplishmentSimulasi: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var btnBack : some View { Button(action: {
        
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image("backBtnWhite")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)

            }
        }
    }
    
    var body: some View {
        NavigationView{
        
        ZStack{
            
            Color(#colorLiteral(red: 0.2533461452, green: 0.3034159541, blue: 0.8465253711, alpha: 1)).ignoresSafeArea(.all)
            
            VStack{
                
                    
                    Text("Simulasi Pelajaran Selesai!")
                        .font(.system(size: 32, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                Spacer()
                    
                    Image("LatihanSimulasi_Badge")
                        .offset(y:48)
                    
                Spacer()
                    
                    
                    Image("bottomCircle")
                        .offset(y:148)
                
                  
                Spacer()
                    
                    
                NavigationLink(
                    destination: Text("Balik ke page pelajaran"),
                    
                    label: {
                        Text("Mulai Latihan Simulasi")
                        .foregroundColor(.white)
                        .font(.system(size:22, design:.rounded))
                        .fontWeight(.bold)
                        .frame(width: 358, height: 50)
                            .background(Color("MainPurple"))
                        .cornerRadius(13)
                            })
            }

    }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
            
            
}
        
    
}
}


struct AccomplishmentSimulasi_Previews: PreviewProvider {
    static var previews: some View {
        AccomplishmentSimulasi()
    }
}
