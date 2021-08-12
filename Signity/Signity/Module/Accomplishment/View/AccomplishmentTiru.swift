//
//  AccomplishmentTiru.swift
//  Signity
//
//  Created by Devina Ranlyca on 06/08/21.
//

import SwiftUI

struct AccomplishmentTiru: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var showCoursePage = false
    
    var body: some View {
        NavigationView{
            
            ZStack{
                
                Color(#colorLiteral(red: 0.2533461452, green: 0.3034159541, blue: 0.8465253711, alpha: 1)).ignoresSafeArea(.all)
                
                VStack{
                    
                    Text("Latihan Tiru Selesai!")
                        .modifier(SignityTitle(color: .white))
                    
                    Spacer()
                    
                    Image("LatihanTiru_Badge")
                        .offset(y:70)
                    
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
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton() {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AccomplishmentTiru_Previews: PreviewProvider {
    static var previews: some View {
        AccomplishmentTiru()
    }
}
