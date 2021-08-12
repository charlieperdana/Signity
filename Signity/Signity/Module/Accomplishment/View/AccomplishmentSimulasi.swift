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
            Color(#colorLiteral(red: 0.2533461452, green: 0.3034159541, blue: 0.8465253711, alpha: 1)).ignoresSafeArea(.all)
            
            VStack{
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image("backBtn")
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                            
                        }
                    }
                    Spacer()
                }
                .padding(.top, 75)
                
                
                Text("Simulasi Pelajaran Selesai!")
                    .modifier(SignityTitle(color: .white))
                
                Spacer()
                
                Image("LatihanSimulasi_Badge")
                    .offset(y:48)
                
                Spacer()
                
                
                Image("bottomCircle")
                    .offset(y:148)
                
                
                Spacer()
                
                
                SignityButton(text: "Kembali ke pelajaran") {
                    self.showCoursePage = true
                }
                
                NavigationLink(destination: CoursePage(), isActive: $showCoursePage) {
                    EmptyView()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton() {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}


struct AccomplishmentSimulasi_Previews: PreviewProvider {
    static var previews: some View {
        AccomplishmentSimulasi()
    }
}
