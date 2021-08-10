//
//  SituationPhraseView.swift
//  Signity
//
//  Created by Hanif Fauzi on 05/08/21.
//

import SwiftUI

struct SituationPhraseView: View {
    @State var showPractice = false
    
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
    
    static let row = 3
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0..<SituationPhraseView.row) { i
                        in
//                        PhraseCell()
                        PhraseBCell()
                    }
                }
                Button(action: {
                    print("Mulai Latihan")
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.showPractice = true
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Mulai Latihan")
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                        Spacer()

                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                    .cornerRadius(13)

                }
                .frame(width: 358.0, height: 44.0)
                //MARK: - NAVIGATION LINKS
//                NavigationLink(destination: PracticeView(), isActive: $showPractice) {
//                    EmptyView()
//                }
                
            }
            .navigationBarTitle("Menanyakan Kabar", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .padding()
            
            
        }
        
    }
   
        
}



struct SituationPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        SituationPhraseView()
    }
}
