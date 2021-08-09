//
//  BasicPhraseView.swift
//  Signity
//
//  Created by Hanif Fauzi on 05/08/21.
//

import SwiftUI

struct BasicPhraseView: View {
    
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
    
    static let row = 6
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<BasicPhraseView.row) { i
                    in PhraseACell()
                }
            }
            .navigationBarTitle("Sapaan", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .padding()

            
        }
    }
}



struct BasicPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        BasicPhraseView()
    }
}
