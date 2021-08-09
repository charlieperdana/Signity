//
//  BasicCharacterView.swift
//  Signity
//
//  Created by Hanif Fauzi on 05/08/21.
//

import SwiftUI

struct BasicCharacterView: View {
    
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
    
    static let column = 5
    static let row = 6
    
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<BasicCharacterView.row) { i
                    in
                    HStack{
                        ForEach(0..<BasicCharacterView.column) { j
                            in CharacterCell()
                        }
                    }
                }
            }
            .navigationBarTitle("Abjad", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .padding()
                        
        }
    }
}

struct BasicCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        BasicCharacterView()
    }
}
